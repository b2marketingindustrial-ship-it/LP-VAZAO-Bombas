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

### Imagens

**Locação**: os quatro cartões ficam só com o ícone, sem foto (decisão de 16/11/2026).

**Logos** (`assets/marcas/`): `kronox.png`, `aro.png` (baixa resolução) e `higra.png` (era JPG quadrado) podem ser trocados por versões melhores com o mesmo nome.

**Banner do hero**: `assets/banner-topo.jpg` (arte 3:1, trocada em 18/11/2026). As bombas ficam no canto inferior esquerdo: no desktop a arte ocupa a largura toda, colada embaixo, e o fundo claro continua para cima com fade (mesmo recurso do fundo das perguntas frequentes); o texto fica acima das bombas e o chat sobre o galpão, à direita. No celular, aparece como um recorte das bombas abaixo do texto. Também é a imagem de compartilhamento (`og:image`). Arte nova com outra composição exige rever o `margin-bottom` de `.hero-copy` (espaço reservado para as bombas).

## Configuração

- `GTM_ID` (no `<script>` do fim do `index.html`): fica vazio, porque no WordPress o GTM já vem do site. Preencher só se a LP for publicada fora dele.
- Todo CTA de orçamento é `<button type="button" class="… btn-slave-whats" data-cta="…">` (padrão B2): o plugin captura o clique e abre o formulário do botão flutuante de WhatsApp (RD Station). Nunca `href` para `#orcamento`. Links de navegação (Ver produtos, atalhos das marcas, abas) continuam `<a>`.
- Evento no `dataLayer`: `cta_click`, com o local do botão (`cta_local`) e o produto clicado (`produto`).
- Chat e formulário são shortcodes do plugin de atendimento do WordPress; o lead é tratado pelo plugin. Fora do WordPress (prévia da Vercel) aparecem como texto puro.

## Regras de conteúdo aplicadas

- Locação **sem marca e sem modelo**, e **sem prazo mínimo** de locação
- "Representante" só aparece na prateleira Higra ("Representante Higra no Nordeste"). "Distribuidor" e "revenda" não aparecem
- Nunca contar soluções, produtos ou marcas ("6 soluções", "Três marcas")
- Nenhum nome de concorrente, nenhum cliente citado
- "Peças nacionais" virou "Componentes nacionais" (Kronox)
- Drenagem separada entre comprar (Higra) e alugar (Locação)

## Rodar localmente

```bash
python3 -m http.server 8000   # http://localhost:8000
```

## Publicação

- **WordPress (produção)**: push em `main` → GitHub Actions (`.github/workflows/build-wp.yml`) copia `index.html`, `assets/`, `robots.txt` e `sitemap.xml` para a raiz da branch órfã `wp-build` → o plugin B2 LP Publisher (WordPress) lê de lá. Não há build: a página é HTML puro com caminhos relativos.
- **Publicação manual**: se o GitHub Actions estiver indisponível (em 16/11/2026 a conta estava bloqueada por cobrança), rodar `bash scripts/publicar-wp.sh` depois do push. Faz o mesmo que o fluxo e atualiza a `wp-build` direto daqui.
- **Vercel**: também publica a cada push na `main`, mas serve só de prévia (os shortcodes não funcionam fora do WordPress).
- URL final: `https://vazao.b2marketingindustrial.com.br/bombas-e-locacao/`
