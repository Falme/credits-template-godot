[README EN-US](https://github.com/Falme/credits-template-godot/blob/main/README_EN-US.md) 👈

[Unity3D Edition](https://github.com/Falme/credits-template-unity) 👈

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

- title: Título dos créditos, normalmente o nome do jogo
- category: Categoria ou nome da função (exemplo: Produtores)
- actors: Nome da pessoa a ser listada (exemplo: Jane Doe)
- spacing: Margem/espaço entre nomes e funções
- image: Imagens no meio dos créditos, como logos e fotos.

Na próxima seção, explicaremos em mais detalhes a estrutura JSON.

## Estrutura JSON

Vou escrever um exemplo de créditos e explicar cada um deles com mais detalhes.

```json
{
	"version": "0.1.0",
	"velocity": 100.0,
	"title": "Super Jump Game 2: \nThe Electric Boogaloo",
	"items": [
		{
			"image": true,
			"path": "credits-template/sprites/example_image.png",
			"height": 400.0
		},
		{
			"space": true,
			"height": 400.0
		},
		{
			"category": true,
			"text": "Director",
			"categorySpacing": 100.0,
			"actorsSpacing": 50.0,
			"actors": [
				"John Doe",
				"Jane Doe",
				"Oscar Garlic"
			]
		},
		{
			"space": true,
			"height": 200.0
		},
		{
			"category": true,
			"text": "Producers",
			"categorySpacing": 100.0,
			"actorsSpacing": 10.0,
			"actors": [
				"John Doe",
				"Jane Doe",
				"Oscar Garlic"
			]
		}
	]
}
```

Explicaremos cada campo de cima para baixo.

- velocity: Velocidade de rolagem dos créditos, velocidade de movimento
- title: Primeiro campo dos créditos, normalmente o nome do jogo
- items: Array contendo todos os objetos que podem ser adicionados aos créditos
	- image: Uma imagem para ser adicionada aos créditos
		- path: Endereço/caminho para a imagem (base é "res://")
		- height: altura da imagem a ser exibida. A largura é proporcional ao tamanho original.
    - space: espaço vazio, uma margem entre uma label e outra label
		- height: altura do espaço a ser exibido
    - category: o título do cargo
		- categorySpacing: Espaço vazio entre o cargo e os nomes
		- actorsSpacing: Espaço vazio entre os nomes e nomes
		- actors: Nomes daqueles que trabalharam no projeto na função especificada acima.
