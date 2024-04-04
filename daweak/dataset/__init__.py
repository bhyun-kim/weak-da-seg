###########################################################################
# Created by: Yi-Hsuan Tsai, NEC Labs America, 2019
###########################################################################

# from .gta5 import GTA5Segmentation
# from .cityscapes import CityscapesSegmentation
# from .synthia import SYNTHIADataSet
from .cfd_s import CFDSSegmentation
from .cfd_t import CFDTSegmentation
from .gaps_s import GAPSSSegmentation
from .gaps_t import GAPSTSegmentation
from .cracktree200_s import Cracktree200SSegmentation
from .cracktree200_t import Cracktree200TSegmentation
from .crack500_s import CRACK500SSegmentation
from .crack500_t import CRACK500TSegmentation
from .kaggle_s import KaggleSSegmentation
from .kaggle_t import KaggleTSegmentation
from .yang_s import YangSSegmentation
from .yang_t import YangTSegmentation
from .rissbilder_s import RissbilderSSegmentation
from .rissbilder_t import RissbilderTSegmentation
from .deepcrack_s import DeepCrackSSegmentation
from .deepcrack_t import DeepCrackTSegmentation
from .pavement_s import PavementSSegmentation
from .pavement_t import PavementTSegmentation
from .concrete_s import ConcreteSSegmentation
from .concrete_t import ConcreteTSegmentation

datasets = {
    # 'gta5': GTA5Segmentation,
    # 'cityscapes': CityscapesSegmentation,
    # 'synthia': SYNTHIADataSet,
    'cfd_s': CFDSSegmentation,
    'cfd_t': CFDTSegmentation,
    'gaps_s': GAPSSSegmentation,
    'gaps_t': GAPSTSegmentation,
    'cracktree200_s': Cracktree200SSegmentation,
    'cracktree200_t': Cracktree200TSegmentation,
    'crack500_s': CRACK500SSegmentation,
    'crack500_t': CRACK500TSegmentation,
    'kaggle_s': KaggleSSegmentation,
    'kaggle_t': KaggleTSegmentation,
    'yang_s': YangSSegmentation,
    'yang_t': YangTSegmentation,
    'rissbilder_s': RissbilderSSegmentation,
    'rissbilder_t': RissbilderTSegmentation,
    'deepcrack_s': DeepCrackSSegmentation,
    'deepcrack_t': DeepCrackTSegmentation,
    'pavement_s': PavementSSegmentation,
    'pavement_t': PavementTSegmentation,
    'concrete_s': ConcreteSSegmentation,
    'concrete_t': ConcreteTSegmentation
}


def get_dataset(name, **kwargs):
    return datasets[name.lower()](name, **kwargs)
