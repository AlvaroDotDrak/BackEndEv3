from django.shortcuts import render
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, TemplateView
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.contrib import messages
from django.urls import reverse_lazy
from .models import Producto, Categoria

# Mixin for Superuser access
class SuperuserRequiredMixin(UserPassesTestMixin):
    def test_func(self):
        return self.request.user.is_superuser

# --- Home Dashboard View ---
class HomeView(TemplateView):
    template_name = 'index.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        if self.request.user.is_authenticated:
            # Estadísticas para el Dashboard
            if self.request.user.is_superuser:
                context['total_productos'] = Producto.objects.count()
            else:
                context['total_productos'] = Producto.objects.filter(user=self.request.user).count()
            
            if self.request.user.is_superuser:
                context['total_categorias'] = Categoria.objects.count()
        return context

# --- Producto Views ---

class ProductoListView(LoginRequiredMixin, ListView):
    model = Producto
    template_name = 'gestorProductos/producto_list.html'
    context_object_name = 'productos'

    def get_queryset(self):
        if self.request.user.is_superuser:
            return Producto.objects.all()
        return Producto.objects.filter(user=self.request.user)

class ProductoCreateView(LoginRequiredMixin, SuccessMessageMixin, CreateView):
    model = Producto
    template_name = 'gestorProductos/producto_form.html'
    fields = ['categoria', 'nombre', 'descripcion', 'precio']
    success_url = reverse_lazy('producto_list')
    success_message = "Producto '%(nombre)s' creado correctamente."

    def form_valid(self, form):
        form.instance.user = self.request.user
        return super().form_valid(form)

class ProductoUpdateView(LoginRequiredMixin, SuccessMessageMixin, UpdateView):
    model = Producto
    template_name = 'gestorProductos/producto_form.html'
    fields = ['categoria', 'nombre', 'descripcion', 'precio']
    success_url = reverse_lazy('producto_list')
    success_message = "Producto actualizado correctamente."
    
    def get_queryset(self):
        qs = super().get_queryset()
        if self.request.user.is_superuser:
            return qs
        return qs.filter(user=self.request.user)

class ProductoDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = Producto
    template_name = 'gestorProductos/producto_confirm_delete.html'
    success_url = reverse_lazy('producto_list')

    def test_func(self):
        return self.request.user.is_superuser

    def delete(self, request, *args, **kwargs):
        messages.success(self.request, "El producto ha sido eliminado del sistema.")
        return super().delete(request, *args, **kwargs)

# --- Categoria Views (Superuser Only) ---

class CategoriaListView(LoginRequiredMixin, SuperuserRequiredMixin, ListView):
    model = Categoria
    template_name = 'gestorProductos/categoria_list.html'
    context_object_name = 'categorias'

class CategoriaCreateView(LoginRequiredMixin, SuperuserRequiredMixin, SuccessMessageMixin, CreateView):
    model = Categoria
    template_name = 'gestorProductos/categoria_form.html'
    fields = ['nombre', 'descripcion']
    success_url = reverse_lazy('categoria_list')
    success_message = "Categoría creada exitosamente."

class CategoriaUpdateView(LoginRequiredMixin, SuperuserRequiredMixin, SuccessMessageMixin, UpdateView):
    model = Categoria
    template_name = 'gestorProductos/categoria_form.html'
    fields = ['nombre', 'descripcion']
    success_url = reverse_lazy('categoria_list')
    success_message = "Categoría actualizada."

class CategoriaDeleteView(LoginRequiredMixin, SuperuserRequiredMixin, DeleteView):
    model = Categoria
    template_name = 'gestorProductos/categoria_confirm_delete.html'
    success_url = reverse_lazy('categoria_list')
    
    def delete(self, request, *args, **kwargs):
        messages.success(self.request, "Categoría eliminada.")
        return super().delete(request, *args, **kwargs)
