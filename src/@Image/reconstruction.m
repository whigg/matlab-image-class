function res = reconstruction(marker, mask, varargin)
%RECONSTRUCTION Morphological reconstruction of marker image under mask image
%
%   REC = reconstruction(MARKER, MASK)
%   Performs a morphological reconstruction of image defined by MARKER
%   under the mask given by MASK. Both MARKER and MASK should be images the
%   same size and the same type.
%
%   Morphological reconstruction is used as base algorithm for several
%   filters such as border removal, holes filling or extended minima and
%   maxima.
%
%   Example
%     % performs morphological reconstruction to extract the 'w' letter
%     % from a binary image representing text
%     mask = Image.read('text.png');
%     marker = Image.create(size(mask), 'logical');
%     marker(94, 13) = true; % set the marker
%     rec = reconstruction(marker, mask);
%     show(rec);
%
%   See also
%   killBorders, fillHoles, extendedMinima, imreconstruct
%

% ------
% Author: David Legland
% e-mail: david.legland@inra.fr
% Created: 2011-08-01,    using Matlab 7.9.0.529 (R2009b)
% Copyright 2011 INRA - Cepia Software Platform.

%   HISTORY

[marker, mask, this] = parseInputCouple(marker, mask);
data = imreconstruct(marker, mask, varargin{:});

% create result image
res = Image('data', data, 'parent', this, 'type', this.type);
