import 'package:challenge/features/album_search/presentation/bloc/content_search_bloc.dart';
import 'package:challenge/network/models/album.dart';
import 'package:challenge/network/models/artist.dart';
import 'package:challenge/network/models/track.dart';
import 'package:challenge/utils/styles.dart';
import 'package:challenge/widgets/details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _textcontroller = TextEditingController();
  String dropdownValue = 'Album';
  String _searchBy = 'Album';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ContentSearchBloc>(context).add(LoadInitialState());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      backgroundColor: Color(0XFF141414),
    );
  }

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(
              child: Column(
            children: [
              SizedBox(height: 40),
              _buildTextfieldAndSearch(),
              SizedBox(height: 40),
              _buildSearchByDropDown(),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Divider(),
              _buildStates()
            ],
          )),
        ],
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        "Music Search App",
        style: muliSemiBold(15, Colors.purpleAccent),
      ),
    );
  }

  _buildTextfieldAndSearch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          width: MediaQuery.of(context).size.width * 0.55,
          child: TextField(
            controller: _textcontroller,
            style: muliRegular(14, Colors.white),
            decoration: InputDecoration(
                labelText: "Search",
                labelStyle: muliRegular(14, Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                prefixIcon: Icon(Icons.music_note, color: Colors.white),
                hintStyle: muliRegular(14, Colors.white),
                hintText: 'Type a song, album or an artist',
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                )),
          ),
        ),
        _buildSearchButton(),
      ],
    );
  }

  _buildSearchButton() {
    return InkWell(
      onTap: () => _getSearchResult(),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0XFF286EF1),
          border: Border.all(color: Color(0XFF286EF1)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Search", style: muliSemiBold(15, Colors.white)),
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.search,
              size: 15,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  _buildSearchByDropDown() {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: DropdownButton<String>(
                value: dropdownValue,
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                    _searchBy = dropdownValue;
                  });
                },
                items: <String>['Album', 'Artist', 'Track']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildStates() {
    return BlocConsumer<ContentSearchBloc, ContentSearchState>(
      cubit: BlocProvider.of<ContentSearchBloc>(context),
      buildWhen: (previous, current) {
        return current is ContentSearchInitial ||
            current is ContentSearchLoading ||
            current is ContentSearchLoaded;
      },
      listenWhen: (previous, current) {
        return current is ContentSearchError;
      },
      builder: (context, state) {
        if (state is ContentSearchInitial || state is ContentSearchLoading) {
          return CircularProgressIndicator();
        } else if (state is ContentSearchLoaded) {
          if (state.contentList != null && state.contentList.isNotEmpty) {
            return _buildResultList(state.contentList, state.searchBy);
          } else {
            return _buildEmptyState();
          }
        }
        return _buildEmptyState();
      },
      listener: (previous, current) async {
        if (current is ContentSearchError) {
          print(current.toString);
        }
      },
    );
  }

  _buildEmptyState() {
    return Container();
  }

  _buildResultList(List<dynamic> contentList, String searchBy) {
    List<dynamic> _typedlist = _checkContentType(contentList);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Results:  " + contentList.length.toString(),
                style: muliRegular(14, Colors.white),
              ),
            ],
          ),
        ),
        ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.white,
              height: 8,
            );
          },
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: contentList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => _showDetails(_typedlist[index].image.last.text,
                  _typedlist[index].name, _typedlist[index].url, searchBy),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 200,
                      child: Text(
                        "$searchBy Name: " + _typedlist[index].name,
                        style: muliRegular(14, Colors.white),
                      ),
                    ),
                    Icon(
                      Icons.info,
                      size: 32,
                      color: Color(0XFF286EF1),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  _getSearchResult() {
    _textcontroller.text.length > 0
        ? BlocProvider.of<ContentSearchBloc>(context)
            .add(GetSearchResult(_textcontroller.text, _searchBy))
        : null;
  }

  _checkContentType(List<dynamic> list) {
    if (list.first is Album) {
      return list as List<Album>;
    } else if (list.first is Artist) {
      return list as List<Artist>;
    } else if (list.first is Track) {
      return list as List<Track>;
    }
  }

  _showDetails(String imgUrl, String name, String url, String type) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return DetailsCard(
            imgUrl: imgUrl,
            name: name,
            url: url,
            type: type,
          );
        });
  }
}
