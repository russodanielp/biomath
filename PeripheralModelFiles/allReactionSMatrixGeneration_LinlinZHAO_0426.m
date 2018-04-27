%%This code generated the whole stoichmatrix including reactions 
%%which are not included in reaction fluxes
%%1. generate fluxes that are independent, which are stored in 
%%independent_f
%%2. get the parameters we want to set according to literatures,
%%which are stored in independent_f_parameters
% $Author: Linlin Zhao $    $Date: 2018/04/25 18:23:52 $ 

%need change the project name if you are using the different model
project = sbioloadproject('Peripheral_Cholesterol_Model.sbproj');
model = project.m1; 
species = model.Species;
reactions = model.Reactions;
species_shape = size(species); 
reactions_shape = size(reactions);
[M,objSpecies,objReactions] = getstoichmatrix(model);
M
s_matrix = sym(zeros(species_shape(1,1),reactions_shape(1,1)));
x_i_sym_list = sym('x', [1 species_shape(1,1)]);
full(M)

for j=1:reactions_shape(1,1)
    reactants_i_list = [];
    products_i_list = [];
    for i=1:species_shape(1,1)
        if M(i,j)==-1
            reactants_i_list = [reactants_i_list,i];
        elseif M(i,j)==1
            products_i_list = [products_i_list,i];
        end
    end
    x_i_name_list = x_i_sym_list(reactants_i_list);
    

    %change the source to 0 and the product from source is 1
    %pay attention to find out the source and sink index in your model
    if reactants_i_list == 46
        reactants_for_matrix = 0;
        products_for_matrix = 1;
    elseif products_i_list == 46
        reactants_for_matrix = -prod(x_i_name_list,2);
        products_for_matrix = 0;
    else
        reactants_for_matrix = -prod(x_i_name_list,2);
        products_for_matrix = prod(x_i_name_list,2); 
    end
   
    for i_reactant = reactants_i_list
        s_matrix(i_reactant, j) = reactants_for_matrix;
    end
    for i_product = products_i_list
        s_matrix(i_product, j) = products_for_matrix;
    end
end
s_matrix


Z = null(s_matrix);
Z_shape = size(Z);
a_i_sym_list = sym('a', [1 Z_shape(1,2)]);
result = sym(zeros(Z_shape(1,1),1));
for z_i=1:Z_shape(1,2)
    result = result + a_i_sym_list([z_i])*Z(:,z_i);
end
result_shape = size(result);
stable_a_list = [];
for result_i = 1:result_shape(1,1)
    for a_i = a_i_sym_list
        if a_i == result(result_i)
            stable_a_list = [stable_a_list,result_i];
        end
    end
end
independent_f = {};
independent_f_parameters = {};
for s_a = stable_a_list
    independent_f{end+1} = get(reactions(s_a,:),'Reaction');
    independent_f{end+1} = get(reactions(s_a,:),'ReactionRate');
    reactants = get(reactions(s_a,:),'Reactants');
    reactants_names = get(reactants, 'Name');
    independent_f_parameters{end+1} = reactants_names;
end

% %%end of code, need to simulating independent flux next



