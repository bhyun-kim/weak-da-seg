###########################################################################
# Created by: Yi-Hsuan Tsai, NEC Labs America, 2019
###########################################################################

from .deeplab_multi import get_deeplab_multi
from .deeplab_v3 import get_deeplab_v3
from .discriminator import get_discriminator, get_classwise_discriminator


def get_segmentation_model(name, **kwargs):
    models = {
        'deeplab': get_deeplab_multi,
        'deeplabv3': get_deeplab_v3
    }
    return models[name.lower()](**kwargs)


def get_discriminator_model(name, **kwargs):
    if name == 'discriminator':
        models = {'discriminator': get_discriminator}
    if name == 'cw_discriminator':
        models = {'cw_discriminator': get_classwise_discriminator}
    return models[name.lower()](**kwargs)
