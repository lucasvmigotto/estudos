# Python

Python foi criada por _Guido van Rossum_ com a ideia de ser uma linguagem de programação em alto nível em que sua filosofia circulava em torno de oferecer aos programadores um código que expressava uma cadeia de conceitos em poucas linhas.

Por ser uma linguagem bem popular, podemos ver sua aplicabilidade variando em diversos ambientes diferentes como _data science_, _web development_, _machine learning_ entre diversos outros.

## Variáveis

Tipos primitivos e associações de valores a variáveis:

```python
# Number
number = 7200

# String
string = 'This is a string'

# Boolean
boolean = True

# Float
float = 0.42
```

## Fluxo de controle

Estrutura `if`, `if/else`,  `if else if`...

```python
if True:
    print('True is true')

if 2 > 1:
    print('2 is greater than 1')
else:
    print('Something is wrong...')

if num1 > num2:
    print('num1 is greater than num2')
elif num2 > num1:
    print('num2 is greater than num1')
else:
    print('num1 is equal to num2')
```

## Laços de repetição

### Laço `for`

```python
for index in range(0,4):
    print(index)
# 0
# 1
# 2
# 3
# 4
```

### Laço `while`

```python
condition = 1 < 2
while condition:
    print('condition keeps %s'%(condition))
    condition = 2 < 1
# condition keeps True
```