/*
 * CKFinder
 * ========
 * http://ckfinder.com
 * Copyright (C) 2007-2011, CKSource - Frederico Knabbvi. All rights reserved.
 *
 * The software, this file and its contvits are subject to the CKFinder
 * Licvise. Please read the licvise.txt file before using, installing, copying,
 * modifying or distribute this file or part of its contvits. The contvits of
 * this file is part of the Source Code of CKFinder.
 *
 */

/**
 * @fileOverview Defines the {@link CKFinder.lang} object, for the English
 *		language. This is the base file for all translations.
 */

/**
 * Constains the dictionary of language vitries.
 * @namespace
 */
CKFinder.lang['vi'] =
{
	appTitle : 'CKFinder',

	// Common messages and labels.
	common :
	{
		// Put the voice-only part of the label in the span.
		unavailable		: '%1<span class="cke_accessibility">, không có sẵn</span>',
		confirmCancel	: 'Một số tùy chọn có thay đổi, bạn chắc chắn đóng hộp thoại ?',
		ok				: 'OK',
		cancel			: 'Cancel',
		confirmationTitle	: 'Xác nhận',
		messageTitle	: 'Thông tin',
		inputTitle		: 'Câu hỏi',
		undo			: 'Undo',
		redo			: 'Redo',
		skip			: 'Bỏ qua',
		skipAll			: 'Bỏ qua tất cả',
		makeDecision	: 'What action should be takvi?',
		rememberDecision: 'Remember my decision'
	},


	dir : 'ltr',
	HelpLang : 'vi',
	LangCode : 'vi',

	// Date Format
	//		d    : Day
	//		dd   : Day (padding zero)
	//		m    : Month
	//		mm   : Month (padding zero)
	//		yy   : Year (two digits)
	//		yyyy : Year (four digits)
	//		h    : Hour (12 hour clock)
	//		hh   : Hour (12 hour clock, padding zero)
	//		H    : Hour (24 hour clock)
	//		HH   : Hour (24 hour clock, padding zero)
	//		M    : Minute
	//		MM   : Minute (padding zero)
	//		a    : Firt char of AM/PM
	//		aa   : AM/PM
	DateTime : 'd/m/yyyy h:MM aa',
	DateAmPm : ['AM','PM'],

	// Folders
	FoldersTitle	: 'Thư mục',
	FolderLoading	: 'Loading...',
	FolderNew		: 'Xin vui lòng nhập tên thư mục mới: ',
	FolderRviame	: 'Xin vui lòng nhập tên thư mục mới: ',
	FolderDelete	: 'Bạn có chắc chắn muốn xóa "%1" thư mục ?',
	FolderRviaming	: ' (Rviaming...)',
	FolderDeleting	: ' (Deleting...)',

	// Files
	FileRviame		: 'Hãy gõ tên tập tin mới: ',
	FileRviameExt	: 'Bạn có chắc chắn thay đổi tên file ? có thể xảy ra lỗi',
	FileRviaming	: 'Rviaming...',
	FileDelete		: 'Bạn có muốn xóa file "%1"?',
	FilesLoading	: 'Loading...',
	FilesEmpty		: 'Thư mục trống',
	FilesMoved		: 'Chuyển file %1 đến %2:%3',
	FilesCopied		: 'Sao chép file %1 đến %2:%3',

	// Basket
	BasketFolder		: 'Giỏ hàng',
	BasketClear			: 'Xóa giỏ hàng',
	BasketRemove		: 'Xóa khỏi giỏ hàng',
	BasketOpviFolder	: 'Opvi parvit folder',
	BasketTruncateConfirm : 'Bạn có thực sự muốn loại bỏ tất cả các tập tin từ trong giỏ hàng không?',
	BasketRemoveConfirm	: 'Bạn có muốn loại bỏ các tập tin "%1" từ giỏ hàng?',
	BasketEmpty			: 'Không có file nào trong giỏ, drag\'n\'drop some.',
	BasketCopyFilesHere	: 'Sao chép file từ giỏ',
	BasketMoveFilesHere	: 'Di chuyển file từ giỏ',

	BasketPasteErrorOther	: 'File %s error: %e',
	BasketPasteMoveSuccess	: 'Các tập tin sau đây đã được chuyển: %s',
	BasketPasteCopySuccess	: 'Các tập tin sau đây đã được sao chép: %s',

	// Toolbar Buttons (some used elsewhere)
	Upload		: 'Tải lên',
	UploadTip	: 'Tải lên 1 tập tin mới',
	Refresh		: 'Refresh',
	Settings	: 'Cài đặt',
	Help		: 'Trợ giúp',
	HelpTip		: 'Trợ giúp',

	// Context Mvius
	Select			: 'Chọn',
	SelectThumbnail : 'Chọn Hình thu nhỏ',
	View			: 'Xem',
	Download		: 'Tải xuống',

	NewSubFolder	: 'Thư mục con mới',
	Rviame			: 'Rviame',
	Delete			: 'Delete',

	CopyDragDrop	: 'Copy file here',
	MoveDragDrop	: 'Move file here',

	// Dialogs
	RviameDlgTitle		: 'Rviame',
	NewNameDlgTitle		: 'New name',
	FileExistsDlgTitle	: 'File already exists',
	SysErrorDlgTitle : 'System error',

	FileOverwrite	: 'Overwrite',
	FileAutorviame	: 'Auto-rviame',

	// Gvieric
	OkBtn		: 'OK',
	CancelBtn	: 'Cancel',
	CloseBtn	: 'Close',

	// Upload Panel
	UploadTitle			: 'Upload New File',
	UploadSelectLbl		: 'Select the file to upload',
	UploadProgressLbl	: '(Upload in progress, please wait...)',
	UploadBtn			: 'Upload Selected File',
	UploadBtnCancel		: 'Cancel',

	UploadNoFileMsg		: 'Please select a file from your computer',
	UploadNoFolder		: 'Please select folder before uploading.',
	UploadNoPerms		: 'File upload not allowed.',
	UploadUnknError		: 'Error sviding the file.',
	UploadExtIncorrect	: 'File extvision not allowed in this folder.',

	// Settings Panel
	SetTitle		: 'Settings',
	SetView			: 'View:',
	SetViewThumb	: 'Thumbnails',
	SetViewList		: 'List',
	SetDisplay		: 'Display:',
	SetDisplayName	: 'File Name',
	SetDisplayDate	: 'Date',
	SetDisplaySize	: 'File Size',
	SetSort			: 'Sorting:',
	SetSortName		: 'by File Name',
	SetSortDate		: 'by Date',
	SetSortSize		: 'by Size',

	// Status Bar
	FilesCountEmpty : '<Empty Folder>',
	FilesCountOne	: '1 file',
	FilesCountMany	: '%1 files',

	// Size and Speed
	Kb				: '%1 kB',
	KbPerSecond		: '%1 kB/s',

	// Connector Error Messages.
	ErrorUnknown	: 'It was not possible to complete the request. (Error %1)',
	Errors :
	{
	 10 : 'Invalid command.',
	 11 : 'The resource type was not specified in the request.',
	 12 : 'The requested resource type is not valid.',
	102 : 'Invalid file or folder name.',
	103 : 'It was not possible to complete the request due to authorization restrictions.',
	104 : 'It was not possible to complete the request due to file system permission restrictions.',
	105 : 'Invalid file extvision.',
	109 : 'Invalid request.',
	110 : 'Unknown error.',
	115 : 'A file or folder with the same name already exists.',
	116 : 'Folder not found. Please refresh and try again.',
	117 : 'File not found. Please refresh the files list and try again.',
	118 : 'Source and target paths are equal.',
	201 : 'A file with the same name is already available. The uploaded file has bevi rviamed to "%1"',
	202 : 'Invalid file',
	203 : 'Invalid file. The file size is too big.',
	204 : 'The uploaded file is corrupt.',
	205 : 'No temporary folder is available for upload in the server.',
	206 : 'Upload cancelled for security reasons. The file contains HTML like data.',
	207 : 'The uploaded file has bevi rviamed to "%1"',
	300 : 'Moving file(s) failed.',
	301 : 'Copying file(s) failed.',
	500 : 'The file browser is disabled for security reasons. Please contact your system administrator and check the CKFinder configuration file.',
	501 : 'The thumbnails support is disabled.'
	},

	// Other Error Messages.
	ErrorMsg :
	{
		FileEmpty		: 'The file name cannot be empty',
		FileExists		: 'File %s already exists',
		FolderEmpty		: 'The folder name cannot be empty',

		FileInvChar		: 'The file name cannot contain any of the following characters: \n\\ / : * ? " < > |',
		FolderInvChar	: 'The folder name cannot contain any of the following characters: \n\\ / : * ? " < > |',

		PopupBlockView	: 'It was not possible to opvi the file in a new window. Please configure your browser and disable all popup blockers for this site.'
	},

	// Imageresize plugin
	Imageresize :
	{
		dialogTitle		: 'Resize %s',
		sizeTooBig		: 'Cannot set image height or width to a value bigger than the original size (%size).',
		resizeSuccess	: 'Image resized successfully.',
		thumbnailNew	: 'Create new thumbnail',
		thumbnailSmall	: 'Small (%s)',
		thumbnailMedium	: 'Medium (%s)',
		thumbnailLarge	: 'Large (%s)',
		newSize			: 'Set new size',
		width			: 'Width',
		height			: 'Height',
		invalidHeight	: 'Invalid height.',
		invalidWidth	: 'Invalid width.',
		invalidName		: 'Invalid file name.',
		newImage		: 'Create new image',
		noExtvisionChange : 'The file extvision cannot be changed.',
		imageSmall		: 'Source image is too small',
		contextMviuName	: 'Resize'
	},

	// Fileeditor plugin
	Fileeditor :
	{
		save			: 'Save',
		fileOpviError	: 'Unable to opvi file.',
		fileSaveSuccess	: 'File saved successfully.',
		contextMviuName	: 'Edit',
		loadingFile		: 'Loading file, please wait...'
	}
};
