const fs = require('fs');
const path = require('path');

const folders = [
  'lib/core/error',
  'lib/core/usecases',
  'lib/core/utils',
  'lib/features/task/data/models',
  'lib/features/task/data/repositories',
  'lib/features/task/data/data_sources',
  'lib/features/task/domain/entities',
  'lib/features/task/domain/repositories',
  'lib/features/task/domain/usecases',
  'lib/features/task/presentation/pages',
  'lib/features/task/presentation/viewmodels',
  'lib/features/task/presentation/widgets',
  'lib/features/settings/data/models',
  'lib/features/settings/data/repositories',
  'lib/features/settings/data/data_sources',
  'lib/features/settings/domain/entities',
  'lib/features/settings/domain/repositories',
  'lib/features/settings/domain/usecases',
  'lib/features/settings/presentation/pages',
  'lib/features/settings/presentation/viewmodels',
  'lib/features/settings/presentation/widgets',
  'lib/features/user/data/models',
  'lib/features/user/data/repositories',
  'lib/features/user/data/data_sources',
  'lib/features/user/domain/entities',
  'lib/features/user/domain/repositories',
  'lib/features/user/domain/usecases',
  'lib/features/user/presentation/pages',
  'lib/features/user/presentation/viewmodels',
  'lib/features/user/presentation/widgets',]

folders.forEach(folder => {
  fs.mkdirSync(path.join(__dirname, folder), { recursive: true });
});

console.log('Folders created successfully!');
