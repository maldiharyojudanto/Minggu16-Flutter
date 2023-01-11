import './models/dashboard.dart';
import './models/category.dart';

const DUMMY_DASHBOARD = [
  Dashboard(
    id: 'd1',
    title: 'Music Theory',
    description: 'ABRSM Standard',
    imageUrl:
    'assets/images/music.png',
  ),
  Dashboard(
    id: 'd2',
    title: 'Piano',
    description: 'Learn piano',
    imageUrl:
    'assets/images/piano.png',
  ),
  Dashboard(
    id: 'd3',
    title: 'Guitar',
    description: 'Learn gitar',
    imageUrl:
    'assets/images/guitar.png',
  ),
  Dashboard(
    id: 'd4',
    title: 'Exercise',
    description: 'Lets quiz',
    imageUrl:
    'assets/images/exam.png',
  )
];

const DUMMY_CATEGORIES = [
  Category(
    id: 'c1',
    categories: [
      'd1',
    ],
    title: 'Music Theory - Grade 1',
    complexity: Complexity.Beginner,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/music-theory%2Fmusic-theory-beg.jpg?alt=media&token=1052dbbd-4903-49ca-86ab-9be0a88e370d',
    duration: 20,
    ingredients: [
      'Learn Theory',
      'Practice 1 hour per day',
      'Consistent',
    ],
    steps: [
      'Rhythm & time values',
      'Bar-lines & time signatures',
      'Notes on the stave',
      'The treble and bass clefs',
      'Rests',
      'Ties and dots',
      'Accidentals',
      'Semitones and tones',
      'Major keys and scales',
      'Degrees of the scale and intervals',
    ],
    isVisible: true,
  ),
  Category(
    id: 'c2',
    categories: [
      'd1',
    ],
    title: 'Music Theory - Grade 2',
    complexity: Complexity.Beginner,
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/music-theory%2Fmusic-theory-beg.jpg?alt=media&token=1052dbbd-4903-49ca-86ab-9be0a88e370d',
    duration: 10,
    ingredients: [
      'Learn Theory',
      'Practice 1 hour per day',
      'Consistent',
    ],
    steps: [
      'Ledger lines',
      'Time signatures',
      'Triplets',
      'Minor keys and scales',
      'Grouping of notes and rests'
    ],
    isVisible: true,
  ),
  Category(
    id: 'c3',
    categories: [
      'd1',
    ],
    title: 'Music Theory - Grade 3',
    complexity: Complexity.Beginner,
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/music-theory%2Fmusic-theory-beg.jpg?alt=media&token=1052dbbd-4903-49ca-86ab-9be0a88e370d',
    duration: 45,
    ingredients: [
      'Learn Theory',
      'Practice 1 hour per day',
      'Consistent',
    ],
    steps: [
      'Demisemiquavers',
      'Major keys and scales with four sharps or flats',
      'Beyond two ledger lines',
      'Transposition',
      'Compound time'
    ],
    isVisible: true,
  ),
  Category(
    id: 'c4',
    categories: [
      'd1',
    ],
    title: 'Music Theory - Grade 4',
    complexity: Complexity.Intermediate,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/music-theory%2Fmusic-theory-inter.jpg?alt=media&token=47fff851-0863-4e71-91d1-f208acdd0e84',
    duration: 60,
    ingredients: [
      'Learn Theory',
      'Practice 1 hour per day',
      'Improvisation',
    ],
    steps: [
      'Time signatures',
      'Alto clef',
      'Double sharps and double flats',
      'Breves, double dots and duplets',
      'Technical names of notes in diatonic scales',
      'Four-bar rhythms',
      'Triads and chords on I, IV and V',
      'Writing a rhythm to words',
      'The chromatic scale',
      'Ornaments'
    ],
    isVisible: true,
  ),
  Category(
    id: 'c5',
    categories: [
      'd1'
    ],
    title: 'Music Theory - Grade 5',
    complexity: Complexity.Intermediate,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/music-theory%2Fmusic-theory-inter.jpg?alt=media&token=47fff851-0863-4e71-91d1-f208acdd0e84',
    duration: 15,
    ingredients: [
      'Learn Theory',
      'Practice 1 hour per day',
      'Improvisation',
    ],
    steps: [
      'Irregular time signatures',
      'Tenor clef',
      'Major keys and scales up to six sharps and flats',
      'Minor keys and scales up to six sharps and flats',
      'Transposition',
      'Voices in score',
      'Irregular time divisions',
      'Naming chords',
      'Composing a melody',
      'Chords at cadential points',
      'Instruments and voices'
    ],
    isVisible: true,
  ),
  Category(
    id: 'c6',
    categories: [
      'd1',
    ],
    title: 'Music Theory - Grade 6',
    complexity: Complexity.Advanced,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/music-theory%2Fmusic-theory-advanced.jpg?alt=media&token=78d97599-8751-4426-bbd6-e770105f68d4',
    duration: 240,
    ingredients: [
      'Learn Theory',
      'More listening music',
      'Practice 1 hour per day',
      'Improvisation',
      'Make arrangement'
    ],
    steps: [
      'Harmonising melodies',
      'Realising figured bass',
      'Tonal melodic composition',
      'Melodic composition in modern styles',
      'Advanced harmonic vocabulary',
    ],
    isVisible: true,
  ),
  Category(
    id: 'c7',
    categories: [
      'd1',
    ],
    title: 'Music Theory - Grade 7',
    complexity: Complexity.Advanced,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/music-theory%2Fmusic-theory-advanced.jpg?alt=media&token=78d97599-8751-4426-bbd6-e770105f68d4',
    duration: 20,
    ingredients: [
      'Learn Theory',
      'More listening music',
      'Practice 1 hour per day',
      'Improvisation',
      'Make arrangement'
    ],
    steps: [
      'Consonance, dissonance and part-writing',
      'Trio sonatas',
      'Keyboard passages',
      'Writing for voices',
      'Writing in four-parts',
    ],
    isVisible: true,
  ),
  Category(
    id: 'c8',
    categories: [
      'd1',
    ],
    title: 'Music Theory - Grade 8',
    complexity: Complexity.Advanced,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/music-theory%2Fmusic-theory-advanced.jpg?alt=media&token=78d97599-8751-4426-bbd6-e770105f68d4',
    duration: 35,
    ingredients: [
      'Learn Theory',
      'More listening music',
      'Practice 1 hour per day',
      'Improvisation',
      'Make arrangement'
    ],
    steps: [
      'Primary triads, secondary triads and when to change chords',
      'Extended chords',
      'Chromatic chords',
      'Chord symbols',
      'Harmonic framework'
    ],
    isVisible: true,
  ),
  Category(
    id: 'c9',
    categories: [
      'd2',
    ],
    title: 'Piano - Grade 1',
    complexity: Complexity.Beginner,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/piano%2Fpiano-beg.jpg?alt=media&token=f65d7fe0-f76e-4b57-bcec-85e9f9b12b70',
    duration: 45,
    ingredients: [
      'Learn Theory',
      'Practice 1 hour per day',
      'Consistent',
    ],
    steps: [
      'A1: Allegretto in C - Anton Diabelli',
      'A2: Dragonflies - Marjorie Helyer',
      'A3: Minuet in C - Alexander Reinagle',
      'B1: Fresh Air - Andrew Eales',
      'B2: A Morning Sunbeam - Florence B. Price',
      'B3: The Quiet Wood - Michael Head',
      'C1: Virginia Hall - Shruthi Rajasekar',
      'C2: Sneaky Business - Martha Mier',
      'C3: Little Whale Explores the Calm Sea - Caroline Tyler'
    ],
    isVisible: true,
  ),
  Category(
    id: 'c10',
    categories: [
      'd2',
    ],
    title: 'Piano - Grade 2',
    complexity: Complexity.Beginner,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/piano%2Fpiano-beg.jpg?alt=media&token=f65d7fe0-f76e-4b57-bcec-85e9f9b12b70',
    duration: 30,
    ingredients: [
      'Learn Theory',
      'Practice 1 hour per day',
      'Consistent',
    ],
    steps: [
      'A1: Écossaise in G - Ludwig van Beethoven',
      'A2: Gavotte in F - J. L. Dussek',
      'A3: Tarantella - Agnieszka Lasko',
      'B1: Forget-me-not Waltz - Stephen Duro',
      'B2: Lullaby - C. V. Stanford',
      'B3: Kangding Love Song - Trad. Chinese',
      'C1: Railroad Blues - David Blackwell'
      'C2: Mozzie - Elissa Milne',
      'C3: Daydream - Kristina Arakelyan'
    ],
    isVisible: true,
  ),
  Category(
    id: 'c11',
    categories: [
      'd2',
    ],
    title: 'Piano - Grade 3',
    complexity: Complexity.Beginner,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/piano%2Fpiano-beg.jpg?alt=media&token=f65d7fe0-f76e-4b57-bcec-85e9f9b12b70',
    duration: 20,
    ingredients: [
      'Learn Theory',
      'Practice 1 hour per day',
      'Consistent',
    ],
    steps: [
      'A1: Minuet in G - Anon.',
      'A2: Vivace - Muzio Clementi',
      'A3: Hansel and Gretel - Mirosław Gąsieniec',
      'B1: The Sad Ghost - Nancy Litten',
      'B2: Study in F - C. A. Loeschhorn',
      'B3: The Song of Twilight - Yoshinao Nakada',
      'C1: T-Rex Hungry - Sonny Chua',
      'C2: The Spanish Guitar - William Gillock',
      'C3: The Entertainer - Scott Joplin'
    ],
    isVisible: true,
  ),
  Category(
    id: 'c12',
    categories: [
      'd2',
    ],
    title: 'Piano - Grade 4',
    complexity: Complexity.Intermediate,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/piano%2Fpiano-inter.jpg?alt=media&token=2e322c3c-0565-4f9f-b4b1-d53a912dc28b',
    duration: 10,
    ingredients: [
      'Learn Theory',
      'Practice 1 hour per day',
      'Consistent',
      'Improvisation',
      'Make arrangement'
    ],
    steps: [
      'A1: Presto - G. B. Pescetti',
      'A2: Mouvement de valse - Louise Farrenc',
      'A3: Allegro in F - G. F. Handel',
      'B1: Billies Song - Valerie Capers',
      'B2: Idylle - Cécile Chaminade',
      'B3: La nouvelle poupée - P. I. Tchaikovsky',
      'C1: Pentatonic Tune - Béla Bartók',
      'C2: Ninettes Musette - George Nevada',
      'C3: Ticklin Toes - Florence B. Price'
    ],
    isVisible: true,
  ),
  Category(
    id: 'c13',
    categories: [
      'd2',
    ],
    title: 'Piano - Grade 5',
    complexity: Complexity.Intermediate,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/piano%2Fpiano-inter.jpg?alt=media&token=2e322c3c-0565-4f9f-b4b1-d53a912dc28b',
    duration: 45,
    ingredients: [
      'Learn Theory',
      'Practice 1 hour per day',
      'Consistent',
      'Improvisation',
      'Make arrangement'
    ],
    steps: [
      'A1: Allegro - Domenico Cimarosa',
      'A2: Minuet and Trio - Joseph Haydn',
      'A3: Jesters Jig - Chee-Hwa Tan',
      'B1: Minnelied - Heinrich Hofmann',
      'B2: Wind in the Willows - Bernadette Marmion',
      'B3: Philomela - Dorothy Pilling',
      'C1: In the Groove - Mike Cornick',
      'C2: Scherzo - D. B. Kabalevsky',
      'C3: A Distant Star in the Stillness - David A. T. Önaç'
    ],
    isVisible: true,
  ),
  Category(
    id: 'c14',
    categories: [
      'd3',
    ],
    title: 'Guitar - Grade 1',
    complexity: Complexity.Beginner,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/guitar%2Fguitar-beg.jpg?alt=media&token=86c2d780-e546-4f6a-9550-7617250b85b6',
    duration: 60,
    ingredients: [
      'Learn Theory',
      'Practice 1 hour per day',
      'Consistent',
    ],
    steps: [
      'Lesson 1: Anatomy of Guitar',
      'Lesson 2: Guitar Setup'
    ],
    isVisible: true,
  ),
  Category(
    id: 'c15',
    categories: [
      'd3'
    ],
    title: 'Guitar - Grade 2',
    complexity: Complexity.Beginner,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/guitar%2Fguitar-beg.jpg?alt=media&token=86c2d780-e546-4f6a-9550-7617250b85b6',
    duration: 15,
    ingredients: [
      'Learn Theory',
      'Practice 1 hour per day',
      'Consistent',
    ],
    steps: [
      'Lesson 3: Musical Notes',
      'Lesson 4: How to Tune a Guitar'
    ],
    isVisible: true,
  ),
  Category(
    id: 'c16',
    categories: [
      'd3',
    ],
    title: 'Guitar - Grade 3',
    complexity: Complexity.Beginner,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/guitar%2Fguitar-beg.jpg?alt=media&token=86c2d780-e546-4f6a-9550-7617250b85b6',
    duration: 240,
    ingredients: [
      'Learn Theory',
      'Practice 1 hour per day',
      'Consistent',
    ],
    steps: [
      'Lesson 5: Posture and How to hold a Pick',
      'Lesson 6: How to Pick and Fret Notes'
    ],
    isVisible: true,
  ),
  Category(
    id: 'c17',
    categories: [
      'd3',
    ],
    title: 'Guitar - Grade 4',
    complexity: Complexity.Intermediate,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/guitar%2Fguitar-inter.jpg?alt=media&token=b482a768-f61b-485d-9cf5-4ff6fb90fc34',
    duration: 20,
    ingredients: [
      'Learn Theory',
      'Practice 1 hour per day',
      'Consistent',
      'Improvisation',
      'Make arrangement'
    ],
    steps: [
      'Lesson 7: How to Read TABs',
      'Lesson 8: How to Read Chord Diagrams and'
    ],
    isVisible: true,
  ),
  Category(
    id: 'c18',
    categories: [
      'd3',
    ],
    title: 'Guitar - Grade 5',
    complexity: Complexity.Intermediate,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/guitar%2Fguitar-inter.jpg?alt=media&token=b482a768-f61b-485d-9cf5-4ff6fb90fc34',
    duration: 35,
    ingredients: [
      'Learn Theory',
      'Practice 1 hour per day',
      'Consistent',
      'Improvisation',
      'Make arrangement'
    ],
    steps: [
      'Lesson 9: Basic Rhythm Theory',
    ],
    isVisible: true,
  ),
  Category(
    id: 'c19',
    categories: [
      'd4',
    ],
    title: 'Quiz - Music Theory',
    complexity: Complexity.Quiz,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/music-theory%2Fmusic-theory-quiz.jpg?alt=media&token=97063136-058d-4ae3-a912-793f3d2033c5',
    duration: 120,
    ingredients: [

    ],
    steps: [

    ],
    isVisible: false,
  ),
  Category(
    id: 'c20',
    categories: [
      'd4',
    ],
    title: 'Quiz - Piano',
    complexity: Complexity.Quiz,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/piano%2Fpiano-quiz.jpg?alt=media&token=29e39e7c-445e-494c-9a42-8cc40a561547',
    duration: 120,
    ingredients: [

    ],
    steps: [

    ],
    isVisible: false,
  ),
  Category(
    id: 'c21',
    categories: [
      'd4',
    ],
    title: 'Quiz - Guitar',
    complexity: Complexity.Quiz,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/tugasflutter-bcee7.appspot.com/o/guitar%2Fguitar-quiz.jpg?alt=media&token=14de97ca-11fd-413a-afe7-60905c8217bd',
    duration: 120,
    ingredients: [

    ],
    steps: [

    ],
    isVisible: false,
  ),
];

