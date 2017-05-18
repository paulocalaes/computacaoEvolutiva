%gaa
function script(dataset, PopSize,crossPerc, mutationPerc)
    ga = construtor(dataset);
    ga.crossOverPerc = crossPerc;
    ga.mutationPerc = mutationPerc;
    ga.popSize = PopSize;
    ga.population = geraPopulacao(PopSize);    
    while (~stopCriteria())
        ga = evolutionaryCicle(ga);
    end
end



function ga = evolutionaryCicle(ga)
    ga = evaluation(ga);
    ga = reproduction(ga);
    ga = evaluation(ga);
    ga = selection(ga);
end

function ga = evaluation(ga)
    s = size(ga.population,1);
    for i=1:s
        ga.populacao{i}.fitness = evaluate(ga.populacao{i}.solution,ga.dataset)
    end
    ga = makeRanking(ga);
end

function ga = reproduction(ga)
    s = size(ga.population,1);
    for i=1:s
        
    end
end

function ga = makeRanking(ga)
    s = size(ga.population,1);
    for i=1:s
        
    end
end

function ga = selection(ga)
    for i=1:ga.popSize;
        newPopulation{i} = select(ga.population);
    end
    ga.population = newPopulation;
end

function [ga] = construtor(dataset)
    ga.dataset = dataset;
end

function [image] = getImage(gaa,i)
    imiage = gaa.dataset.image{i};
end

function [nImagens] = numImages(gaa)
    nImagens = size(gaa.dataset.image);
end




%Solucao do gaa
function [gaa] = constructor(gaa)
    gaa =gaa;
end

function [solucao] = construtor_solucao_aleatoria()
    solucao.minCircularity = rand();
    solucao.maxCircularity = rand();
    solucao.intensity = rand();
    solucao.min_area = rand();
    solucao.max_area = rand();
end

function display(solucao)
    disp(['MinCircularity: ' solucao.minCircularity]);
    disp(['MaxCircularity: ' solucao.maxCircularity]);
    disp(['Intensity: ' solucao.intensity]);
    disp(['min_area: ' solucao.min_area]);
    disp(['max_area: ' solucao.max_area]);
end

function fitness = evaluate(solucao_parametros,gaa_dataset)
    %funcao mais complexa
end

function [solucao_m] = mutation(solucao_m,taxaMutacao)
    if randi([1 100],1)>taxaMutacao
        solucao_m.maxIntensidade = solucao_m.maxIntensidade + floor(max(min(randn(1),5.0),-5.0));
    end
    if randi([1 100],1)>taxaMutacao
        solucao_m.minArea = solucao_m.minArea + floor(max(min(randn(1),5.0),-5.0));
    end
    if randi([1 100],1)>taxaMutacao
        solucao_m.maxArea = solucao_m.maxArea + floor(max(min(randn(1),5.0),-5.0));
    end
    if randi([1 100],1)>taxaMutacao
        solucao_m.minCircularidade = solucao_m.minCircularidade + max(min(randn(1),1.0),-1.0);
    end
    if randi([1 100],1)>taxaMutacao
        solucao_m.maxCircularidade = solucao_m.maxCircularidade + max(min(randn(1),1.0),-1.0);
    end
end

function [solucao_c] = crossover(solucao1, solucao2)
    if randi([1 100],1)>50
        solucao_c.max_intensity = solucao1.max_intensity;
    else
        solucao_c.max_intensity = solucao2.max_intensity;
    end
    if randi([1 100],1)>50
        solucao_c.min_area = solucao1.min_area;
    else
        solucao_c.min_area = solucao2.min_area;
    end
    if randi([1 100],1)>50
        solucao_c.max_area = solucao1.max_area;
    else
        solucao_c.max_area = solucao2.max_area;
    end
    if randi([1 100],1)>50
        solucao_c.min_circularity = solucao1.min_circularity;
    else
        solucao_c.min_circularity = solucao2.min_circularity;
    end
    if randi([1 100],1)>50
        solucao_c.max_circularity = solucao1.max_circularity;
    else
        solucao_c.max_circularity = solucao2.max_circularity;
    end
end

function [min_circularity] = getMinCircularity(solucao)
    min_circularity = solucao.min_circularity;
end

function [max_circularity] = getMaxCircularity(solucao)
    max_circularity = solucao.max_circularity;
end

function [intensity] = getIntensity(solucao)
    intensity = solucao.intensity;
end

function [min_area] = getmin_area(solucao)
    min_area = solucao.min_area;
end

function [max_area] = getmax_area(solucao)
    max_area = solucao.max_area;
end