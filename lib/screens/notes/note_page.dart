import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fotmob/database/note_database.dart';
import 'package:fotmob/models/note.dart';
import 'package:fotmob/screens/notes/add_edit_note_page.dart';
import 'package:fotmob/screens/notes/note_detail_page.dart';
import 'package:fotmob/utils/colors.dart';
import 'package:fotmob/widgets/note_card_widgets.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});
  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late List<Note> notes;
  var isLoading = false;

  Future refreshNotes() async {
    setState(() {
      isLoading = true;
    });
    notes = await NoteDatabase.instance.getAllNotes();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : notes.isEmpty
              ? const Center(child: Text("Catatan Kosong"))
              : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  itemCount: notes.length,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    return GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NoteDetailPage(id: note.id!),
                          ),
                        );
                        refreshNotes();
                      },
                      child: NoteCardWidget(note: note, index: index),
                    );
                  },
                ),
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEditNotePage()),
          );
          refreshNotes();
        },
        backgroundColor: AppColors.green,
        child: const Icon(Icons.add, color: AppColors.black),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.darkBlackGray,
      title: const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          "Catatan Pertandingan",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
