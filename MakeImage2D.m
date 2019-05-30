function figure1=MakeImage2D(Image, ARG1, ARG2, ARG3, ARG4, ARG5)

%
% Simply takes the image data and creates a 2D image
%
%   Image = The data set that you wish to image
%   Limit = The bounding limits that you wish to look at
%
% Originally created on 6/5/2018
% Wesley Holmes twesholmes@gmail.com
%

% nargin
% This determines the number of input arguments

% If only one argument is passes, then only the image will be produced
if iscell(Image)
    minimum = min(Image{1}(:));
    maximum = max(Image{1}(:));
else
    minimum = min(Image(:));
    maximum = max(Image(:));
end
Win = abs(maximum) + abs(minimum);
LevV = (maximum+minimum)/2;
WLAdjCoe = 1;

if nargin == 1 && iscell(Image) ~= 1
    
    figure1 = figure;
    imagesc(Image);
    axis tight;
    colormap gray;
    axis off;
    axis equal;
    colorbar
    title(inputname(1), 'Interpreter', 'none') % This grabs the name of the variable and uses it as the title of the Image
    % end
    
    
    % Adjusting for the Window Width
elseif nargin == 2 && iscell(Image) ~= 1
    
    
    % Making a title
    if ischar(ARG1)
        TitleName = ARG1;
        figure1 = figure;
        imagesc(Image); % This is imposing the limit about zero on the Image
        axis tight;
        colormap gray;
        axis off;
        axis equal;
        colorbar
        title(TitleName, 'Interpreter', 'none') % This grabs the name of the variable and uses it as the title of the Image
        
        % Adjusting the window level
    else
        figure1 = figure;
        ARG2 = ARG1; % This is switched because Amir wants the Window Level first BUT what if you only want the width adjusted?
        imagesc(Image, ARG2*[-1 1]); % This is imposing the limit about zero on the Image
        axis tight;
        colormap gray;
        axis off;
        axis equal;
        colorbar
        title(inputname(1), 'Interpreter', 'none') % This grabs the name of the variable and uses it as the title of the Image
    end
    % end
    
    % Adjusting for the Window Width and the Window Location
elseif nargin == 3 && iscell(Image) ~= 1 && strcmp(ARG1,'Threshold')
    
    AlphaLevel = 0.5;
    cmap = spring(1);
    
    Thres = (Image > ARG2);
    for JJ = 1:3
        ThresholdImage(:,:,JJ) = Thres .* cmap(JJ);
    end
    AlphaData = Thres .* AlphaLevel;
    
    figure1 = figure;
    axes1 = axes('Parent',figure1);
    hold(axes1, 'on')
    set(gca,'YDir','reverse')
    ImageSet = imagesc(Image);
    ImageSet = imagesc(ThresholdImage,'Alphadata',AlphaData);
    axis tight;
    colormap gray;
    axis off;
    axis equal;
    colorbar
    % title(inputname(1)) % This grabs the name of the variable and uses it as the title of the Image
    % end
    
    % Adjusting the Threshold settings, you are set up with a lower bound and an uppber
    % bound of the threshold
elseif nargin == 4 && iscell(Image) ~= 1 && strcmp(ARG1,'Threshold')
    
    AlphaLevel = 0.5;
    cmap = spring(1);
    
    Thres = (Image > ARG2 & Image < ARG3);
    for JJ = 1:3
        ThresholdImage(:,:,JJ) = Thres .* cmap(JJ);
    end
    AlphaData = Thres .* AlphaLevel;
    
    figure1 = figure;
    axes1 = axes('Parent',figure1);
    hold(axes1, 'on')
    set(gca,'YDir','reverse')
    ImageSet = imagesc(Image);
    ImageSet = imagesc(ThresholdImage,'Alphadata',AlphaData);
    axis tight;
    colormap gray;
    axis off;
    axis equal;
    colorbar
    % title(inputname(1)) % This grabs the name of the variable and uses it as the title of the Image
    % end
    
    %
    % Same as above but without the threshold aspect
    %
elseif nargin == 4 && iscell(Image) ~= 1
    figure1 = figure;
    axes1 = axes('Parent',figure1);
    hold(axes1, 'on')
    set(gca,'YDir','reverse')
    imagesc(Image, ARG2 + ARG3*[-1 1]); % This is imposing the limit about zero on the Image
    axis tight;
    colormap gray;
    axis off;
    axis equal;
    colorbar
    title(ARG1, 'Interpreter', 'none') % This grabs the name of the variable and uses it as the title of the Image
    % end
    
    % Adjusting the Threshold settings, you are set up with a lower bound and an uppber
    % bound of the threshold
    % Now adding in the window width and window level
elseif nargin == 6 && iscell(Image) ~= 1 && strcmp(ARG1,'Threshold')
    
    AlphaLevel = 0.5;
    cmap = spring(1);
    
    Thres = (Image > ARG2 & Image < ARG3);
    for JJ = 1:3
        ThresholdImage(:,:,JJ) = Thres .* cmap(JJ);
    end
    AlphaData = Thres .* AlphaLevel;
    
    figure1 = figure;
    axes1 = axes('Parent',figure1);
    hold(axes1, 'on')
    set(gca,'YDir','reverse')
    ImageSet = imagesc(Image, ARG4 + ARG5*[-1 1]);
    ImageSet = imagesc(ThresholdImage,'Alphadata',AlphaData);
    axis tight;
    colormap gray;
    axis off;
    axis equal;
    colorbar
    % title(inputname(1)) % This grabs the name of the variable and uses it as the title of the Image
    % end
    
    % Adjusting for the Window Width and the Window Location
elseif nargin == 3 && iscell(Image) ~= 1
    size(Image);
    figure1 = figure;
    imagesc(Image, ARG1 + ARG2*[-1 1]); % This is imposing the limit about zero on the Image
    axis tight;
    colormap gray;
    axis off;
    axis equal;
    colorbar
    title(inputname(1), 'Interpreter', 'none') % This grabs the name of the variable and uses it as the title of the Image
    % end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % This checks to see if the input image is a cell and then proceeds to create a grid style approach to display the individual images
elseif nargin == 1 && iscell(Image) == 1
    
    figure1 = figure;
    imagesc(cell2mat(Image));
    axis tight;
    colormap gray;
    axis off;
    axis equal;
    colorbar
    title(inputname(1), 'Interpreter', 'none') % This grabs the name of the variable and uses it as the title of the Image
    
    % end
    
    % Adjusting for the Window Width
elseif nargin == 2 && iscell(Image) == 1
    
    figure1 = figure;
    if ischar(ARG1)
        imagesc(cell2mat(Image));
        axis tight;
        colormap gray;
        axis off;
        axis equal;
        colorbar
        title(ARG1, 'Interpreter', 'none') % This grabs the name of the variable and uses it as the title of the Image
    else
        ARG2 = ARG1; % This is switched because Amir wants the Window Level first BUT what if you only want the width adjusted?
        imagesc(cell2mat(Image), ARG2*[-1 1]);
        axis tight;
        colormap gray;
        axis off;
        axis equal;
        colorbar
        title(inputname(1), 'Interpreter', 'none') % This grabs the name of the variable and uses it as the title of the Image
    end
    
    % end
    
elseif nargin == 3 && iscell(Image) == 1 && strcmp(ARG1,'Threshold')
    
    NewImage = cell2mat(Image);
    
    AlphaLevel = 0.5;
    cmap = spring(1);
    
    Thres = (NewImage > ARG2);
    for JJ = 1:3
        ThresholdImage(:,:,JJ) = Thres .* cmap(JJ);
    end
    AlphaData = Thres .* AlphaLevel;
    
    figure1 = figure;
    axes1 = axes('Parent',figure1);
    hold(axes1, 'on')
    set(gca,'YDir','reverse')
    ImageSet = imagesc(NewImage);
    ImageSet = imagesc(ThresholdImage,'Alphadata',AlphaData);
    axis tight;
    colormap gray;
    axis off;
    axis equal;
    colorbar
    title(inputname(1), 'Interpreter', 'none') % This grabs the name of the variable and uses it as the title of the Image
    
    % Adjusting for the Window Width and the Window Location
elseif nargin == 3 && iscell(Image) == 1
    
    figure1 = figure;
    imagesc(cell2mat(Image), ARG1 + ARG2*[-1 1]);
    axis tight;
    colormap gray;
    axis off;
    axis equal;
    colorbar
    title(inputname(1), 'Interpreter', 'none') % This grabs the name of the variable and uses it as the title of the Image
    
    
else   
    
    % imagesc(cell2mat(Image))
    surf(Image)
    
    fprintf('Not sure whats going on... \n')
    
end


    function mouseClick (~, ~, ~)
        
        MouseStat = get(gcbf, 'SelectionType');       
        
        set(figure1,'KeyPressFcn',@KeyPressCb);
        
        
        if strcmp(MouseStat,'alt')
            InitialCoord = get(0,'PointerLocation');
            set(gcf, 'WindowButtonMotionFcn', @WinLevAdj);
            
        elseif strcmp(MouseStat,'n')
            
            
        else
            % disp('Not a selectable axis')
        end
        
        % -=< Window and level mouse adjustment >=- 
        function WinLevAdj(varargin)
            
            PosDiff = get(0,'PointerLocation') - InitialCoord;
            
            Win = Win + PosDiff(1) * WLAdjCoe;
            LevV = LevV - PosDiff(2) * WLAdjCoe;
            
            if (Win < 1)
                Win = 1;
            end
            
            set(gca,'CLim', LevV + [(-Win/2) (Win/2)])
            
            % set(lvalhand, 'String', sprintf('%6.0f',LevV));
            % set(wvalhand, 'String', sprintf('%6.0f',Win));
            InitialCoord = get(0,'PointerLocation');
        end                
        
    end

% -=< Mouse button released callback function >=-
    function mouseRelease (~,~)
        set(gcf, 'WindowButtonMotionFcn', '')
    end

set(gca, 'ButtonDownFcn', @mouseClick);
set(get(gca,'Children'),'ButtonDownFcn', @mouseClick); 
set(gcf,'WindowButtonUpFcn', @mouseRelease)

end

















