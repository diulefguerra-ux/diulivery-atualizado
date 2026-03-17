package br.com.projeto.model;

/**
 * Classe de modelo para a tabela prato.
 * Reflete os atributos e o relacionamento com Categoria conforme o DER.
 */
public class Prato {
    // Atributos baseados no seu diagrama (DER)
    private int idprato;
    private String nome;
    private String descricao;
    private double preco;
    private String imagemurl;
    
    // Relacionamento: Um prato pertence a uma Categoria
    private Categoria categoria;

    // Construtor vazio (padrão Java Bean)
    public Prato() {}

    // Getters e Setters
    public int getIdprato() { 
        return idprato; 
    }
    public void setIdprato(int idprato) { 
        this.idprato = idprato; 
    }

    public String getNome() { 
        return nome; 
    }
    public void setNome(String nome) { 
        this.nome = nome; 
    }

    public String getDescricao() { 
        return descricao; 
    }
    public void setDescricao(String descricao) { 
        this.descricao = descricao; 
    }

    public double getPreco() { 
        return preco; 
    }
    public void setPreco(double preco) { 
        this.preco = preco; 
    }

    public String getImagemurl() { 
        return imagemurl; 
    }
    public void setImagemurl(String imagemurl) { 
        this.imagemurl = imagemurl; 
    }

    // Getter e Setter para o novo relacionamento
    public Categoria getCategoria() { 
        return categoria; 
    }
    public void setCategoria(Categoria categoria) { 
        this.categoria = categoria; 
    }
}