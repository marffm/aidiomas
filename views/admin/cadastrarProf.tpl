<div class="container">
    <ol class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['link']; ?>"><?php echo $breadcrumb['title']; ?></a></li>
        <?php } ?>
    </ol>

    <div class="row">
        <div class="col-sm-3">
            <div class="admin_user">                
                <h4>Área Administrativa</h4>
                <hr />
                <div class="icon"><i class="fa fa-user fa-4x"></i></div>
                <p class="admin_name"><?php echo $data['username'] ?></p>
                <p class="admin-name-category">Usuário administrativo</p>
                <p class="admin-logoff"><a href="<?php echo $data['destroy'] ?>">Sair</a></p>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">Alunos</h4>
                </div>
                <div class="panel-body">
                    <a href="#" class="list-group-item">Fabiana - paragrafo</a>
                    <a href="#" class="list-group-item">Leticia - Paragrafo</a>
                    <a href="#" class="list-group-item active">Cadastrar Aluno</a>
                </div>
            </div>
        </div>

        <div class="col-sm-9">

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">Cadastro de Professor</h4>
                </div>
                <div class="panel-body">
                    <form action="<?php echo PATH_URL ?>cadastrarProf/insertProf" method="POST">
                        <input type="hidden" nome="nivel" id="nivel" value="2" />
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Nome</label>
                                <input type="text" name="nome" id="nome" required max-length="25" class="form-control" placeholder="Nome" /> 
                            </div>

                            <div class="col-sm-6">
                                <label>Sobrenome</label>
                                <input type="text" name="sobrenome" id="sobrenome" required max-length="50" class="form-control" placeholder="Sobrenome" /> 
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-4">
                                <label>Telefone</label>
                                <input type="text" name="telefone" id="telefone" max-length="15" class="form-control" placeholder="(00) 0000-0000" />
                            </div>
                            <div class="col-sm-5">
                                <label>E-mail</label>
                                <input type="text" name="email" id="email" max-length="30" class="form-control" placeholder="nome@servidordeemail.com.br" />
                            </div>
                            <div class="col-sm-3">
                                <label>Idioma</label>
                                <select id="idioma" name="idioma" class="form-control">
                                    <option value="1">Inglês</option>
                                    <option value="2">Espanhol</option>
                                    <option value="3">Francês</option>
                                    <option value="4">Alemão</option>
                                </select>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-5">
                                <label>Usuário</label>
                                <input type="text" name="usuario" id="usuario" required max-length="15" class="form-control" placeholder="Usuário" /> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <label>Senha</label>
                                <input type="text" name="senha" id="senha" required max-length="8" class="form-control" placeholder="12345678" />
                            </div>
                        </div>

                        <div class="article_buttons">
                            <button type="submit" class="btn btn-default">Salvar</button>
                        </div>


                    </form>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">Professores Cadastrados</h4>
                </div>
                <div class="panel-body">
                    
                    <?php foreach ($data['profList'] as $professores) { ?>
                    <div class="col-sm-4">
                        <div class="panel panel-default">
                            <form action="" method="POST" class="panel-body">
                                <span>Nome</span>
                                <input name="nome" id="nome" required max-length="25" class="form-control" placeholder="Nome" value="<?php echo $professores['nome'] ?>" />
                                <span>Sobrenome</span>
                                <input type="text" name="sobrenome" id="sobrenome" required max-length="50" class="form-control" placeholder="Sobrenome" value="<?php echo $professores['sobrenome'] ?>" />
                                <span>Telefone</span>
                                <input type="text" name="telefone" id="telefone" max-length="15" class="form-control" placeholder="(00) 0000-0000" value="<?php echo $professores['telefone'] ?>" />
                                <span>E-mail</span>
                                <input type="text" name="email" id="email" max-length="30" class="form-control" placeholder="nome@servidordeemail.com.br" value="<?php echo $professores['email'] ?>" />
                            </form>
                        </div>                        
                    </div>
                    <?php } ?>
                </div>
            </div>

        </div>

    </div>



</div>