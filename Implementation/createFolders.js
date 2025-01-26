
const fs = require('fs');
const path = require('path');

const structure = [
  // Core Layer
  { folder:   'lib/core/config' },
  { folder:   'lib/core/extensions' },
  { folder:   'lib/core/errors' },
  { folder:   'lib/core/usecases' },
  { folder:   'lib/core/datasources' },
  { folder:   'lib/core/repositories' },
  { folder:   'lib/core/utils' },


  // Data Layer
  { folder: 'lib/features/dataLayer/models', file: 'Model.dart' },
  { folder: 'lib/features/dataLayer/datasources', file: 'DataSource.dart' },
  { folder: 'lib/features/dataLayer/repositories', file: 'Repository.dart' },
  
  // Domain Layer
  { folder: 'lib/features/domainLayer/entities', file: 'Entity.dart' },
  { folder: 'lib/features/domainLayer/repositories', file: 'RepositoryInterface.dart' },
  { folder: 'lib/features/domainLayer/usecases', file: 'UseCase.dart' },
  
  // Presentation Layer
  { folder: 'lib/features/presentationLayer/views', file: 'View.dart' },
  { folder: 'lib/features/presentationLayer/viewmodels', file: 'ViewModel.dart' },
  { folder: 'lib/features/presentationLayer/widgets', file: 'Widget.js' },
];

structure.forEach(item => {
  const folderPath = path.join(__dirname, item.folder);
  const filePath = path.join(folderPath, item.file);

  // Create the folder if it doesn't exist
  fs.mkdirSync(folderPath, { recursive: true });

  // Create the file if it doesn't exist
  if (!fs.existsSync(filePath)) {
    fs.writeFileSync(filePath, '', 'utf8');
  }
});

console.log('Clean Architecture folders and files created successfully!');



// const fs = require('fs');
// const path = require('path');

// const folders = [
//   'lib/core/error',
//   'lib/core/usecases',
//   'lib/core/utils',
//   'lib/features/task/data/models',
//   'lib/features/task/data/repositories',
//   'lib/features/task/data/data_sources',
//   'lib/features/task/domain/entities',
//   'lib/features/task/domain/repositories',
//   'lib/features/task/domain/usecases',
//   'lib/features/task/presentation/pages',
//   'lib/features/task/presentation/viewmodels',
//   'lib/features/task/presentation/widgets',
//   'lib/features/settings/data/models',
//   'lib/features/settings/data/repositories',
//   'lib/features/settings/data/data_sources',
//   'lib/features/settings/domain/entities',
//   'lib/features/settings/domain/repositories',
//   'lib/features/settings/domain/usecases',
//   'lib/features/settings/presentation/pages',
//   'lib/features/settings/presentation/viewmodels',
//   'lib/features/settings/presentation/widgets',
//   'lib/features/user/data/models',
//   'lib/features/user/data/repositories',
//   'lib/features/user/data/data_sources',
//   'lib/features/user/domain/entities',
//   'lib/features/user/domain/repositories',
//   'lib/features/user/domain/usecases',
//   'lib/features/user/presentation/pages',
//   'lib/features/user/presentation/viewmodels',
//   'lib/features/user/presentation/widgets',]

// folders.forEach(folder => {
//   fs.mkdirSync(path.join(__dirname, folder), { recursive: true });
// });

// console.log('Folders created successfully!');
