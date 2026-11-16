# LP Bombas Industriais — Vazão Engenharia

Landing page da campanha **Bombas Industriais** (Google Ads) da **Vazão Engenharia e Montagem**. Reúne os 4 grupos da campanha numa página só: **Kronox**, **ARO**, **Higra** e **Locação de Bombas**.
Palavra-chave principal: **bombas industriais** (no H1 e no título da aba). Cada prateleira repete o termo do seu grupo no título.

## Estrutura

- `index.html`: página única e autocontida (HTML, CSS e JS inline). Fonte: Plus Jakarta Sans. Identidade visual igual à da LP NR13 e do site da Vazão (marinho `#0b3f8a`, azul `#2468cc`, vermelho `#e1062f`).
- `assets/`: imagens, com caminho direto no HTML (sem tentativa automática de `.webp`/`.jpg`/`.png`). Foto nova ou trocada: salvar o arquivo e apontar o caminho no `index.html`.
- CSS em um bloco por seção, na ordem da página, cada um com as próprias versões para telas menores. Largura única: caixa de 1320px com respiro de 40/24/16px (igual à LP NR13).

### Blocos

1. Topo no padrão da LP NR13: logo, tagline "Bombas industriais e locação" e botão "Solicitar orçamento" (sem menu)
2. Hero: H1 "Bombas industriais Kronox, ARO e Higra", pontos Engenharia · Nordeste · Desde 1991 e o chat do plugin (`[atendimento_chat id="default"]`)
3. Linhas de bombas: Kronox, ARO, Higra e Locação (atalhos para as prateleiras) + selos "Venda e locação na mesma equipe" e "Locação com equipamentos revisados"
4. Vitrine com uma prateleira por marca e a de locação; ARO com comparativo pneumática × elétrica
5. Como funciona a locação (etapas, sem prazos) + quando optar pela locação
6. Aplicações: captação, elevatória de esgoto, drenagem (compra **e** locação), ETE + mineração (locação)
7. Diferenciais
8. Perguntas frequentes (Locação e Bombas), repetidas nos dados estruturados (`FAQPage`) do `<head>`
9. Faixa do especialista "Não escolha a bomba pelo tamanho." + orçamento: texto, dados que o cliente pode enviar e o formulário do plugin (`[atendimento_form id="default-form"]`)
10. Rodapé no padrão da LP NR13: copyright · endereço · crédito da B2

### Imagens pendentes

**Locação** (1200×900, foto de campo **sem marca em destaque**) para `assets/locacao/`: `bombas-para-mineracao`, `bombas-de-drenagem`, `bombas-de-incendio`, `sistemas-de-bombeamento`. Hoje os quatro cartões aparecem sem foto, só com o ícone; quando as fotos chegarem, incluir no cartão um `<div class="media loaded"><img src="..." alt="..."></div>` antes do `product-b`.

**Logos** (`assets/marcas/`): `kronox.png`, `aro.png` (baixa resolução) e `higra.png` (era JPG quadrado) podem ser trocados por versões melhores com o mesmo nome.

**Banner do hero**: `assets/banner-topo.jpg`. Arte com as bombas reduzidas e o fundo estendido para cima e para a direita, para o chat ficar sobre a parte escura sem cobrir as bombas. No celular, aparece como um recorte das bombas abaixo do texto. Também é a imagem de compartilhamento (`og:image`).

## Configuração

- `GTM_ID` (no `<script>` do fim do `index.html`): ID do Google Tag Manager. Vazio = não carrega.
- Evento no `dataLayer`: `cta_click`, com o local do botão (`cta_local`) e o produto clicado (`produto`).
- Chat e formulário são shortcodes do plugin de atendimento do WordPress; o lead é tratado pelo plugin.

## Regras de conteúdo aplicadas

- Locação **sem marca e sem modelo**, e **sem prazo mínimo** de locação
- "Representante" só aparece na prateleira Higra ("Representante Higra no Nordeste"). "Distribuidor" e "revenda" não aparecem
- Nunca contar soluções, produtos ou marcas ("6 soluções", "Três marcas")
- Nenhum nome de concorrente, nenhum cliente citado
- "Peças nacionais" virou "Componentes nacionais" (Kronox)
- Drenagem separada entre comprar (Higra) e alugar (Locação)

## Pendências

- [ ] Fotos de locação (acima)
- [ ] URL final da LP (hoje `https://vazao.b2marketingindustrial.com.br/bombas-industriais/` no canonical, `og:url`, `og:image`, dados estruturados, robots e sitemap)
- [ ] ID do GTM
- [ ] Perguntas frequentes: validar com o comercial
- [ ] Negativas do grupo Kronox: lista vazia no briefing (pendência da mídia)
- [ ] "bomba de incêndio" (genérica) atrai também quem quer **comprar**; a página só aluga
- [ ] O Grupo 3 (Higra) hoje aponta para `/product-category/aro/`

## Rodar localmente

```bash
python3 -m http.server 8000   # http://localhost:8000
```

## Deploy

Vercel, conectada a este repositório: todo push na `main` publica em produção.
