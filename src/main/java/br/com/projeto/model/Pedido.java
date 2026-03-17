package br.com.projeto.model;

import java.sql.Timestamp;

public class Pedido {
    private int idpedido;
    private Timestamp data; // Aqui resolve o erro do rs.getTimestamp
    private String status;
    private Cliente cliente; // Objeto Cliente
    private Prato prato;     // Objeto Prato (Resolve o ped.setPrato)

    // Getters e Setters
    public int getIdpedido() { return idpedido; }
    public void setIdpedido(int idpedido) { this.idpedido = idpedido; }

    public Timestamp getData() { return data; }
    public void setData(Timestamp data) { this.data = data; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Cliente getCliente() { return cliente; }
    public void setCliente(Cliente cliente) { this.cliente = cliente; }

    public Prato getPrato() { return prato; }
    public void setPrato(Prato prato) { this.prato = prato; }
}