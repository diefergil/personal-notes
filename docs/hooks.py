import os
import shutil

def copy_ads_txt(config, **kwargs):
    site_dir = config['site_dir']
    shutil.copy('theme/assets/ads.txt', os.path.join(site_dir, 'ads.txt'))
