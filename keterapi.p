### KETERAPI: Sistema Gerenciador de Associados

    -- Comandos

        -- Consultar endpoint GET

            curl https://localhost:8080 -o resposta.json
            curl -X POST "http://localhost:8080/api/v1/pessoa" -H "Content-Type: application/json" -d '{"nomeCompleto": "Grianrumo Noan Grotiagui Touim"}'
            curl -s "http://localhost:8080/api/v1/pessoa" | jq
            curl -s -X PUT "http://localhost:8080/api/v1/pessoa/6" -H "Content-Type: application/json" -d '{"nomeCompleto": "Samuel Mariano"}' | jq
            curl -s -X GET "http://localhost:8080/api/v1/pessoa/filter?nome=Samuel+Evandro" | jq

    -- Tarefas

        KETERAPI20240912174856

            🔵 feature: Implementar modelagem de dados dos Associados

        KETERAPI20240917094925
        
            🔵 feature: Implementar classe de entidade referente aos Associados gerenciados pelo sistema
            🔵 feature: Configurar acesso ao banco de dados PostgreSQL
            🔵 feature: Configurar FlyWay ao projeto

        KETERAPI20240917113931

            🔵 feature: Implementar endpoint da funcionalidade de pessoas

        KETERAPI20240917141457

            🔵 feature: Implementar endpoint da funcionalidade de gestão de usuários do sistema
            🔵 feature: Implementar gerenciamento de acessos da API com JWT

        KETERAPI20240917201550

            🟡 refactor: Remover método de consulta de pessoas ativas do sistema

        KETERAPI20240918102204

            🔵 feature: Implementar tratamento de Erros ao realizar requisicoes aos endpoints da funcionalidade de cadastro de pessoas

        KETERAPI20240918145756

            🔵 feature: Permite consultar dados por na funcionalidade de cadastro de pessoas
            🟡 refactor: Refactor de implementacoes

        KETERAPI20240920110706

            🔵 feature: Recuperar o endereço da API dinamicamente
            
        KETERAPI20241015095144
        
        	🔵 feature: Implementar modelagem da funcionalidade de Dependentes de Associado principal
        	
        KETERAPI20241015100436
        
        	🔵 feature: Implementar modelagem da funcionalidade de Documentos de Pessoas

            🔵 feature:
            🔴 hotfix:
            🟠 bugfix:
            🟢 release:
            🟡 refactor: 
            🟣 test: