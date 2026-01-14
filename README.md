[README EN-US](https://github.com/Falme/credits-template-godot/blob/main/README_EN-US.md) 👈

# Credits Template : Godot Edition

Template para a interface de créditos para seu jogo (na Godot Engine) com as informações carregadas pelo JSON.

---

## Motivos?

Todo jogo deveria ter uma tela de créditos, mesmo que o jogo tenha sido desenvolvido por uma única pessoa, os criadores da obra devem ser registrados. O problema é que sempre precisamos criar uma nova cena para os créditos em cada jogo, e a tela de créditos é sempre diferente, porque cada jogo é diferente.

Assim, tendo isso em mente, não criei uma cena propriamente dita para os créditos, mas sim um modelo de interface dos créditos prontos para uso.

## Como Começar?

Baixe o arquivo `credits-godot-x-x-x.zip` mais recente na [Página de Releases](https://github.com/Falme/credits-template-godot/releases) e extraia para a pasta `res://` do seu projeto Godot.

Você deverá ter uma nova pasta no seguinte caminho: `res://credits-template`.

Agora, se você quiser um exemplo de como funciona, tenho uma cena em `credits-template/scenes/credits-example.tscn` (caso prefira aprender por meio de exemplos).

De qualquer forma, o modelo pode ser encontrado em `credits-template/prefabs/credits.tscn`, este é o modelo principal. Para usá-lo, basta adicioná-lo como filho de um node Control, pois o modelo é 100% herdado da interface/Control.

Para alterar o conteúdo dos créditos, você precisará modificar o arquivo JSON em `credits-template/data/credits.json`. Decidi colocar as informações em um arquivo JSON para que não apenas os desenvolvedores, mas qualquer membro da equipe, possa modificá-lo.

Para explicar rapidamente cada campo:

- title: Título da cena de créditos, normalmente o nome do jogo
- category: Categoria ou nome do cargo (exemplo: Produtores)
- actors: Nome da pessoa a ser listada (exemplo: Jane Doe)

Na próxima seção, explicaremos em mais detalhes a estrutura JSON.

## Estrutura JSON

Vou escrever um exemplo de créditos e explicar cada um deles com mais detalhes.

```json
{
	"velocity": 100.0,
	"title": "Super Jump Game 2: Electric Boogaloo",
	"labels": [
		[
			"Directors",
			"John Doe",
		],
		[
			"Producers",
			"Jane Doe"
			"Joe Mama",
			"Oscar Garlic"
		]
	]
}
```

Explicaremos cada campo de cima para baixo.

- velocity: Velocidade de rolagem dos créditos, velocidade de movimento
- title: Primeiro campo dos créditos, normalmente o nome do jogo
- labels: Pessoas que trabalharam no projeto e suas funções
    - Primeiro campo: Categoria, título do cargo
    - Outros campos: Nomes das pessoas que trabalharam no projeto na função especificada acima.



