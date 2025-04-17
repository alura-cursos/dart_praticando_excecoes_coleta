List<Map<String, dynamic>> dadosCorrompidos = [
  {
    "id": "um", // Erro: ID não numérico
    "nome": "Ponto de Coleta Araújo",
    "localizacao": {"latitude": -16.172379, "longitude": -48.524686},
    "endereco": "", // Erro: endereço vazio
    "materiais_aceitos": ["papel", "eletrônicos"],
    "horario_funcionamento": "Seg-Sex 7h às 18h",
    "nivel_preenchimento": 0.74,
  },
  {
    "id": 2,
    "nome": "", // Erro: nome vazio
    "localizacao": {"latitude": 23.444689, "longitude": 2.670606},
    "endereco": "Loteamento Cavalcanti, 7, Cachoeirinha, AM",
    "materiais_aceitos": ["baterias", "óleo de cozinha"],
    "horario_funcionamento": "Seg-Sex 7h às 17h",
    "nivel_preenchimento": 0.22,
  },
  {
    "id": 3,
    "nome": "Ponto de Coleta da Mota de Minas",
    "localizacao": {"latitude": -77.6991105, "longitude": 175.013},
    "endereco": "Chácara Lucas Gabriel Castro, 84, Vila Canto Doce",
    "materiais_aceitos": [], // Erro: lista vazia
    "horario_funcionamento": "Seg-Sáb 7h às 20h",
    "nivel_preenchimento": 0.59,
  },
  {
    "id": 4,
    "nome": "Ponto de Coleta Fogaça da Prata",
    "localizacao": {"latitude": -31.047502, "longitude": -5.902033},
    "endereco": "Largo Nunes, 41, Savassi",
    "materiais_aceitos": ["metal", "óleo de cozinha"],
    "horario_funcionamento": "Seg-Sáb 8h às 18h",
    "nivel_preenchimento": -0.1, // Erro: valor negativo
  },
  {
    "id": 5,
    "nome": "Ponto de Coleta das Neves Grande",
    "localizacao": {"latitude": 46.7749225, "longitude": 84.954299},
    "endereco": "Condomínio da Costa, 26, Mirante",
    "materiais_aceitos": ["plástico", "baterias", "óleo de cozinha", "papel"],
    "horario_funcionamento": "Seg-Sáb 8h às 19h",
    "nivel_preenchimento": 0.81,
  },
];
