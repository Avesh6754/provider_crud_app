class Onboardingclass{
   String? name,image,label;
  Onboardingclass({required this.label,required this.name,required this.image});
  factory Onboardingclass.fomMap(Map m1)
  {
    return Onboardingclass(label:m1['text1'], name: m1['text2'], image: m1['image']);
  }
}