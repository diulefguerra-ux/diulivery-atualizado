package br.com.projeto.model;

/**
 * Classe de modelo para a tabela itempedido.
 * Representa o vínculo entre um Pedido e um Prato específico.
 */
public class ItemPedido {
    private int iditempedido;
    private int quantidade;
    private double subtotal;
    private String observacao; // Campo adicionado para refletir o diagrama
    private Prato prato;       // Relacionamento Many-to-One com Prato
    private Pedido pedido;     // Relacionamento Many-to-One com Pedido

    // Construtor vazio padrão
    public ItemPedido() {}

    // Getters e Setters
    public int getIditempedido() { 
        return iditempedido; 
    }
    public void setIditempedido(int iditempedido) { 
        this.iditempedido = iditempedido; 
    }

    public int getQuantidade() { 
        return quantidade; 
    }
    public void setQuantidade(int quantidade) { 
        this.quantidade = quantidade; 
    }

    public double getSubtotal() { 
        return subtotal; 
    }
    public void setSubtotal(double subtotal) { 
        this.subtotal = subtotal; 
    }

    public String getObservacao() { 
        return observacao; 
    }
    public void setObservacao(String observacao) { 
        this.observacao = observacao; 
    }

    public Prato getPrato() { 
        return prato; 
    }
    public void setPrato(Prato prato) { 
        this.prato = prato; 
    }

    public Pedido getPedido() { 
        return pedido; 
    }
    public void setPedido(Pedido pedido) { 
        this.pedido = pedido; 
    }
}