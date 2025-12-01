from django.shortcuts import render
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.urls import reverse_lazy
from .models import Producto, Categoria

# Mixin for Superuser access
class SuperuserRequiredMixin(UserPassesTestMixin):
    def test_func(self):
        return self.request.user.is_superuser

# --- Producto Views ---

class ProductoListView(LoginRequiredMixin, ListView):
    model = Producto
    template_name = 'gestorProductos/producto_list.html'
    context_object_name = 'productos'

    def get_queryset(self):
        if self.request.user.is_superuser:
            return Producto.objects.all()
        return Producto.objects.filter(user=self.request.user)

class ProductoCreateView(LoginRequiredMixin, CreateView):
    model = Producto
    template_name = 'gestorProductos/producto_form.html'
    fields = ['categoria', 'nombre', 'descripcion', 'precio']
    success_url = reverse_lazy('producto_list')

    def form_valid(self, form):
        form.instance.user = self.request.user
        return super().form_valid(form)

class ProductoUpdateView(LoginRequiredMixin, UpdateView):
    model = Producto
    template_name = 'gestorProductos/producto_form.html'
    fields = ['categoria', 'nombre', 'descripcion', 'precio']
    success_url = reverse_lazy('producto_list')
    
    def get_queryset(self):
        # Ensure users can only edit their own products unless superuser
        # Although not explicitly asked, it's good practice. 
        # However, keeping strictly to prompt: "Eliminar... solo Superusuarios".
        # It doesn't restrict Update explicitly, but implied ownership. 
        # I will stick to basic filter if not superuser just to be safe?
        # The prompt says "Listar... Si usuario normal filtra...". 
        # For Update, I'll allow if they own it or if superuser.
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

# --- Categoria Views (Superuser Only) ---

class CategoriaListView(LoginRequiredMixin, SuperuserRequiredMixin, ListView):
    model = Categoria
    template_name = 'gestorProductos/categoria_list.html'
    context_object_name = 'categorias'

class CategoriaCreateView(LoginRequiredMixin, SuperuserRequiredMixin, CreateView):
    model = Categoria
    template_name = 'gestorProductos/categoria_form.html'
    fields = ['nombre', 'descripcion']
    success_url = reverse_lazy('categoria_list')

class CategoriaUpdateView(LoginRequiredMixin, SuperuserRequiredMixin, UpdateView):
    model = Categoria
    template_name = 'gestorProductos/categoria_form.html'
    fields = ['nombre', 'descripcion']
    success_url = reverse_lazy('categoria_list')

class CategoriaDeleteView(LoginRequiredMixin, SuperuserRequiredMixin, DeleteView):
    model = Categoria
    template_name = 'gestorProductos/categoria_confirm_delete.html'
    success_url = reverse_lazy('categoria_list')