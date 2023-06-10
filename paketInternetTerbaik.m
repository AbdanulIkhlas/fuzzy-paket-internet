function varargout = paketInternetTerbaik(varargin)
% PAKETINTERNETTERBAIK MATLAB code for paketInternetTerbaik.fig
%      PAKETINTERNETTERBAIK, by itself, creates a new PAKETINTERNETTERBAIK or raises the existing
%      singleton*.
%
%      H = PAKETINTERNETTERBAIK returns the handle to a new PAKETINTERNETTERBAIK or the handle to
%      the existing singleton*.
%
%      PAKETINTERNETTERBAIK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PAKETINTERNETTERBAIK.M with the given input arguments.
%
%      PAKETINTERNETTERBAIK('Property','Value',...) creates a new PAKETINTERNETTERBAIK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before paketInternetTerbaik_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to paketInternetTerbaik_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help paketInternetTerbaik

% Last Modified by GUIDE v2.5 10-Jun-2023 23:02:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @paketInternetTerbaik_OpeningFcn, ...
                   'gui_OutputFcn',  @paketInternetTerbaik_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before paketInternetTerbaik is made visible.
function paketInternetTerbaik_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to paketInternetTerbaik (see VARARGIN)

% Choose default command line output for paketInternetTerbaik
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes paketInternetTerbaik wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = paketInternetTerbaik_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function sliderHarga_Callback(hObject, eventdata, handles)
% hObject    handle to sliderHarga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% mengambil value dari slider harga
sliderHarga = get(hObject,'Value');
% menampilkan ke field harga
set(handles.fieldHarga, 'string',strcat(num2str(sliderHarga),' K') );

if sliderHarga <= 25
    harga = 'murah';
elseif sliderHarga > 25 && sliderHarga <= 60
    harga = 'sedang';
else
    harga = 'mahal';
end

% menampilkan ke text harga
set(handles.textHarga, 'string', harga);

 
% mengambil value slider GB
sliderGB = get(handles.sliderGB,'Value');
% menampilkan slider gb ke field GB
set(handles.fieldGB, 'string',strcat(num2str(sliderGB),' GB') );

if sliderGB <= 5
    GB = 'sedikit';
elseif sliderGB > 5 && sliderGB <= 25
    GB = 'sedang';
else
    GB = 'banyak';
end

% menampilkan ke text harga
set(handles.textGB, 'string', GB);


% memasukkan ke fuzzy
input = [sliderHarga sliderGB];
fis = readfis('FuzzyPaketInternet');
output = evalfis(input,fis);
 
if output <= 20
    hasil = 'jelek';
elseif output > 20 && output <= 70
    hasil = 'lumayan';
else
    hasil = 'bagus';
end
 
% menampilkan hasil
set(handles.fieldHasil,'string',num2str(output));
set(handles.textHasil, 'string', hasil);

% --- Executes during object creation, after setting all properties.
function sliderHarga_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderHarga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end





% --- Executes on slider movement.
function sliderGB_Callback(hObject, eventdata, handles)
% hObject    handle to sliderGB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% mengambil value slider GB
sliderGB = get(hObject,'Value');
% menampilkan slider gb ke field GB
set(handles.fieldGB, 'string',strcat(num2str(sliderGB),' GB') );

if sliderGB <= 5
    GB = 'sedikit';
elseif sliderGB > 5 && sliderGB <= 25
    GB = 'sedang';
else
    GB = 'banyak';
end

% menampilkan ke text harga
set(handles.textGB, 'string', GB);


% mengambil value slider harga
sliderHarga = get(handles.sliderHarga,'Value');
% menampilkan ke field harga
set(handles.fieldHarga, 'string',strcat(num2str(sliderHarga),' K') );

if sliderHarga <= 25
    harga = 'murah';
elseif sliderHarga > 25 && sliderHarga <= 60
    harga = 'sedang';
else
    harga = 'mahal';
end

% menampilkan ke text harga
set(handles.textHarga, 'string', harga);



% memasukkan ke fuzzy
input = [sliderHarga sliderGB];
fis = readfis('FuzzyPaketInternet');
output = evalfis(input,fis);
 
if output <= 20
    hasil = 'jelek';
elseif output > 20 && output <= 70
    hasil = 'lumayan';
else
    hasil = 'bagus';
end
 
% menampilkan hasil
set(handles.fieldHasil,'string',num2str(output));
set(handles.textHasil, 'string', hasil);



% --- Executes during object creation, after setting all properties.
function sliderGB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderGB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
