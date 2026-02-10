[README EN-US](./README.md) 👈

[Unity3D Edition](https://github.com/Falme/credits-template-unity) 👈

# Credits Template : Godot Edition

Template para a interface de créditos para seu jogo (na Godot Engine) com as informações carregadas pelo JSON.

---

## Motivos?

Todo jogo deveria ter uma tela de créditos, mesmo que o jogo tenha sido desenvolvido por uma única pessoa, os criadores da obra devem ser registrados. O problema é que sempre precisamos criar uma nova cena para os créditos em cada jogo, e a tela de créditos é sempre diferente, porque cada jogo é diferente.

Assim, tendo isso em mente, não criei uma cena propriamente dita para os créditos, mas sim um modelo de interface dos créditos prontos para uso.

## Como Começar?

Baixe o arquivo `credits-godot-x-x-x.zip` mais recente na [Página de Releases](https://github.com/Falme/credits-template-godot/releases) e extraia para a pasta `res://` do seu projeto Godot.

Você deverá ter uma nova pasta no seguinte caminho: `res://addons/credits-template`.

Agora, se você quiser um exemplo de como funciona, tenho uma cena em `credits-template/scenes/credits-example.tscn` (caso prefira aprender por meio de exemplos).

De qualquer forma, o modelo pode ser encontrado em `credits-template/prefabs/credits.tscn`, este é o modelo principal. Para usá-lo, basta adicioná-lo como filho de um node Control, pois o modelo é 100% herdado da interface/Control.

Para alterar o conteúdo dos créditos, você precisará modificar o arquivo JSON em `credits-template/data/credits.json`. Decidi colocar as informações em um arquivo JSON para que não apenas os desenvolvedores, mas qualquer membro da equipe, possa modificá-lo.

Na próxima seção, explicaremos em mais detalhes a estrutura JSON.

## Estrutura JSON

Vou escrever um exemplo de créditos e explicar cada um deles com mais detalhes.

```json
{
	"version": "0.0.1",
	"velocity": 100.0,
	"items": [
		{
			"type": "title",
			"text": "Super Jump Game 2: \nThe Electric Boogaloo"
		},
		{
			"type": "space",
			"height": 100.0
		},
		{
			"type": "image", 
			"path": "sprites/example_image.png", 
			"height": 400
		},
		{
			"type": "category",
			"text": "Created By"
		},
		{
			"type": "actor",
			"actors": [
				"Falme Streamless"
			]
		},
		{
			"type": "space",
			"height": 100.0
		},
		{
			"type": "category",
			"text": "Special Thanks"
		},
		{
			"type": "actor",
			"actors": [
				"Alex Arroyo",
				"Danilo Cavedon",
				"Ruan Lima",
				"And everyone who shared this project!"
			]
		}
	]
}
```

Explicaremos cada campo de cima para baixo.

- version: Se você quiser acompanhar a versão dos créditos do seu jogo (não aparece na tela)
- velocity: Velocidade de rolagem dos créditos, velocidade de movimento
- items: Array contendo todos os objetos de itens que podem ser adicionados aos créditos
	- title: Texto especial, geralmente o primeiro campo dos créditos e normalmente o nome do jogo
	- image: Uma imagem para ser adicionada aos créditos
		- path: Endereço/caminho para a imagem (base é "res://")
		- height: altura da imagem a ser exibida. A largura é proporcional ao tamanho original.
    - space: espaço vazio, uma margem entre um item e outro item
		- height: altura do espaço a ser exibido
    - category: o título do cargo
	- actor: Nomes daqueles que trabalharam no projeto na função especificada acima.
		- actors: Array de nomes. Tente não colocar muitos nomes em um único array. Divida-o para melhor desempenho.

