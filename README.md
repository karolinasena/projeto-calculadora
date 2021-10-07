# Projeto Calculadora
Projeto de uma calculadora para a disciplina de Compiladores do Bacharelado em Ciência da Computação do IFCE.

### Pré-requisitos
- GCC
- Flex
- Bison

### Como compilar a aplicação

**Clone o repositório**

```
git clone https://github.com/karolinasena/projeto-calculadora.git
```

 **Dentro da pasta do projeto, criar um arquivo *makefile* contendo o código abaixo:**
 
 Para o Linux:
```
all: calc.l calc.y
	flex -i calc.l
	bison calc.y
	gcc calc.tab.c -o Calculadora -lfl
	./Calculadora
 ```
**No terminal, executar o comando:**

```
  make
```

### Uso da linguagem

**Início e fim do programa**
```
  init
    ...
  end 
```

**Atribuição de valores às variáveis**
```
 a = 10
```

**Ler variáveis**
```
 read(a)
```

**Escrever variáveis**
```
 write(a)
```
