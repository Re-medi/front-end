import 'package:flutter/material.dart';
import 'package:remedi/ui/themes/IconAssets.dart';

enum DiseaseCategory {
  gastro,         // 소화기계
  infectious,     // 감염질환
  cardio,         // 심혈관계
  neuro,          // 정신 ∙ 신경계
  oncoimmune,     // 종양 ∙ 면역계
  msk,            // 근 ∙ 골격계
  hema,           // 혈액 ∙ 조혈기계
  respiratory,    // 호흡기계
  gu,             // 비뇨생식기계∙성호르몬
  derm,           // 피부질환
  ent,            // 안과 ∙ 귀
  endo,           // 내분비계 ∙ 호르몬
}

class Disease {
  final String name;
  final DiseaseCategory category;
  final Widget icon;
  final List<String> keywords;

  Disease({
    required this.name,
    required this.category,
    required this.icon,
    required this.keywords,
  });
}


final List<Disease> diseaseCards = [
  Disease(
      name: '소화기계',
      category: DiseaseCategory.gastro,
      icon: IconAssets.iconGastro(),
      keywords: ["산분비억제", "장관운동", "궤양", "식이성 비만", "설사", "소화기능"]
  ),
  Disease(
      name: '감염질환',
      category: DiseaseCategory.infectious,
      icon: IconAssets.iconInfectious(),
      keywords: ["항바이러스제", "항생제", "항진균제", "면역글로불린제", "베타락탐저해제"]
  ),
  Disease(
      name: '심혈관계',
      category: DiseaseCategory.cardio,
      icon: IconAssets.iconCardio(),
      keywords: ["혈압강하", "심장기능", "지질이상"]
  ),
  Disease(
      name: '정신 ∙ 신경계',
      category: DiseaseCategory.neuro,
      icon: IconAssets.iconNeuro(),
      keywords: ["진통제", "정신병치료제", "수면,진정,마취제", "뇌질환치료제"]
  ),
  Disease(
      name: '종양 ∙ 면역계',
      category: DiseaseCategory.oncoimmune,
      icon: IconAssets.iconOncoimmune(),
      keywords: ["항종양제", "면역억제제"]
  ),
  Disease(
      name: '근 ∙ 골격계',
      category: DiseaseCategory.msk,
      icon: IconAssets.iconMsk(),
      keywords: ["류마티스", "근이완", "골다공증", "통풍"]
  ),
  Disease(
      name: '혈액 ∙ 조혈기계',
      category: DiseaseCategory.hema,
      icon: IconAssets.iconHema(),
      keywords: ["항응고", "혈전용해", "지혈, 조혈"]
  ),
  Disease(
      name: '호흡기계',
      category: DiseaseCategory.respiratory,
      icon: IconAssets.iconRespiratory(),
      keywords: ["천식,COPD", "거담제", "항히스타민제", "진해제", "비강제제"]
  ),
  Disease(
      name: '비뇨생식기계∙성호르몬',
      category: DiseaseCategory.gu,
      icon: IconAssets.iconGu(),
      keywords: ["전립선비대증", "요실금", "발기부전", "성호르몬제", "분만 촉진,지연"]
  ),
  Disease(
      name: '피부질환',
      category: DiseaseCategory.derm,
      icon: IconAssets.iconDerm(),
      keywords: ["국소용", "건선치료"]
  ),
  Disease(
      name: '안과 ∙ 귀',
      category: DiseaseCategory.ent,
      icon: IconAssets.iconEnt(),
      keywords: ["녹내장", "안과염증", "귀"]
  ),
  Disease(
      name: '내분비계 ∙ 호르몬',
      category: DiseaseCategory.endo,
      icon: IconAssets.iconEndo(),
      keywords: ["성장호르몬", "부신피질", "항이뇨", "갑상선"]
  ),
];