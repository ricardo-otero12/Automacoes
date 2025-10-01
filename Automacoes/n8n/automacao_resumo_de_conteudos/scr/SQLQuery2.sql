-- Prompt para ser incluído no ChatGPT (em JavaScript):

Resuma o seguinte texto em 5 tópicos claros e objetivos, mantendo o conteúdo em Português Brasileiro: {{ $json.textocompleto }};

-- Sintaxe a ser utilizada para obter as informações extraídas dos artigos quando do envio do e-mail (em JavaScript):

Aqui está o resumo dos links: {{ $('Get row(s) in sheet').item.json['Link do Artigo'] }};
