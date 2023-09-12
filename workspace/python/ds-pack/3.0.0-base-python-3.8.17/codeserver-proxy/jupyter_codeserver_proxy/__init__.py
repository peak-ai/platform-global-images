import os

def setup_codeserver():
  return {
    'command': ['code-server', 
                '--auth', 
                'none', 
                '--disable-telemetry', 
                '--port={port}'
                '--install-extension',
                'cweijan.vscode-database-client2'],
    'launcher_entry': {
        'title': 'VS Code',
        'icon_path': os.path.join(os.path.dirname(os.path.abspath(__file__)), 'icons', 'vs_code_icon.svg')
    }
  }
