package br.com.projeto.model;

public class Entrega {
    private int identrega;
    private String enderecoEntrega;
    private String dataEntrega;
    private String statusEntrega;
    private Pedido pedido; // Relacionamento com Pedido do diagrama

    // Getters e Setters
    public int getIdentrega() { return identrega; }
    public void setIdentrega(int identrega) { this.identrega = identrega; }
    public String getEnderecoEntrega() { return enderecoEntrega; }
    public void setEnderecoEntrega(String enderecoEntrega) { this.enderecoEntrega = enderecoEntrega; }
    public String getDataEntrega() { return dataEntrega; }
    public void setDataEntrega(String dataEntrega) { this.dataEntrega = dataEntrega; }
    public String getStatusEntrega() { return statusEntrega; }
    public void setStatusEntrega(String statusEntrega) { this.statusEntrega = statusEntrega; }
    public Pedido getPedido() { return pedido; }
    public void setPedido(Pedido pedido) { this.pedido = pedido; }
}