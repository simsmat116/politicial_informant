PRAGMA foreign_keys = ON;

INSERT INTO candidates(fullName, website, party)
VALUES
    ('Donald J. Trump', 'www.donaldjtrump.com', 'Republican'),
    ('William F. Weld', 'weld2020.org', 'Republican'),
    ('Bernie Sanders', 'berniesanders.com', 'Democratic'),
    ('Tulsi Gabbard', 'www.tulsi2020.com', 'Democratic'),
    ('Joseph R. Biden Jr.', 'joebiden.com', 'Democratic');

INSERT INTO policies(policyName, candidateName, stance, source)
VALUES
    (
        'Education',
        'Donald J. Trump',
        'President Trump and his Administration supported the expansion of school choice across the country so every parent has a voice in their child’s education.',
        'www.promiseskept.com/#'
    ),
    (
        'Education',
        'William F. Weld',
        'Elementary and secondary education is primarily a matter for states and localities and accordingly, federal intervention should be minimal.',
        'weld2020.org/wp-content/uploads/2019/12/weld2020_policypaper_education.pdf'
    ),
    (
        'Education',
        'Bernie Sanders',
        'Every human being has the fundamental right to a good education. On this 65th anniversary of the Brown v. Board of Education decision, we are committed to creating an education system that works for all people, not just the wealthy and powerful.',
        'berniesanders.com/issues/reinvest-in-public-education/'
    ),
    (
        'Education',
        'Tulsi Gabbard',
        ' In order to invest in our future, we have to provide adequate resources and meaningful accountability to ensure that all our students have equal access to quality education.',
        'www.tulsi2020.com/issues/education-teachers'
    ),
    (
        'Education',
        'Joseph R. Biden Jr.',
        'At a forum with teachers in Houston, Texas, Vice President Biden is outlining a plan that 1) provides educators the support and respect they need and deserve, and 2) invests in all children from birth, so that regardless of their zip code, parents’ income, race, or disability, they are prepared to succeed in tomorrow’s economy.',
        'joebiden.com/education/'
    ),
    (
        'Health Care',
        'Donald J. Trump',
        'President Trump repealed the Obamacare individual mandate, expanded plan choices and increased competition to bring down costs for consumers.',
        'www.promiseskept.com/#'
    ),
    (
        'Health Care',
        'William F. Weld',
        'Health care is a vital component of our lives that works best when we have the right kind of capitalism – the kind that produces more individual consumer choices for both costs and coverages, and more competition that drives prices down.',
        'weld2020.org/wp-content/uploads/2019/11/weld2020_policypaper_healthcare.pdf'
    ),
    (
        'Health Care',
        'Bernie Sanders',
        'Create a Medicare for All, single-payer, national health insurance program to provide everyone in America with comprehensive health care coverage, free at the point of service. No networks, no premiums, no deductibles, no copays, no surprise bills.',
        'berniesanders.com/issues/medicare-for-all/'
    ),
    (
        'Health Care',
        'Tulsi Gabbard',
        'I will make healthcare a priority. I support a single-payer system where everyone contributes and is covered, and that will also allow individuals to access private insurance if they choose.',
        'tulsi2020.com/issues/healthcare-all'
    ),
    (
        'Health Care',
        'Joseph R. Biden Jr.',
        'Instead of starting from scratch and getting rid of private insurance, he has a plan to build on the Affordable Care Act by giving Americans more choice, reducing health care costs, and making our health care system less complex to navigate.',
        'joebiden.com/healthcare/'
    ),
    (
        'Immigration',
        'Donald J. Trump',
        'President Trump protected the American homeland by enforcing immigration laws, so that every American can feel safe in their community.',
        'www.promiseskept.com/#'
    ),
    (
        'Immigration',
        'William F. Weld',
        'When I am President, I will streamline our system so that more people can quickly and easily enter our country and begin contributing to our communities and economy. I will greatly expand the work visa program, stop mass deportations, and simplify the immigration adjudication process.',
        'weld2020.org/wp-content/uploads/2019/11/weld2020_policypaper_immigration.pdf'
    ),
    (
        'Immigration',
        'Bernie Sanders',
        'Bernie believes we must stand up for our values and accept refugees, asylum-seekers, and families who come to the United States in search of the American Dream.',
        'berniesanders.com/issues/welcoming-and-safe-america-all/'
    ),
    (
        'Immigration',
        'Tulsi Gabbard',
        'On immigration, I will not accept the false choice between compassion and security that is currently being offered to us. It will be my policy to balance border security, have an asylum process that reflects our values as a nation of immigrants, and include a path to legal status for DREAMers.',
        'www.tulsi2020.com/issues/immigration-reform'
    ),
    (
        'Immigration',
        'Joseph R. Biden Jr.',
        'As president, Biden will forcefully pursue policies that safeguard our security, provide a fair and just system that helps to grow and enhance our economy, and secure our cherished values. ',
        'joebiden.com/immigration/'
    ),
    (
        'Gun Control',
        'Donald J. Trump',
        'President Trump protected the American homeland by enforcing immigration laws, so that every American can feel safe in their community.',
        'https://www.promiseskept.com/#'
    ),
    (
        'Gun Control',
        'William F. Weld',
        'The Supreme Court’s Heller decision in 2008 confirmed that the 2nd Amendment’s protection of the right to bear arms applies to individuals. In short, the 2nd Amendment means what it says.',
        'weld2020.org/wp-content/uploads/2019/11/weld2020_policypaper_firearms.pdf'),
    (
        'Gun Control',
        'Bernie Sanders',
        'When we are in the White House, we will move aggressively to end the epidemic of gun violence in this country and pass the common sense gun safety legislation that the overwhelming majority of Americans want.',
        'berniesanders.com/issues/gun-safety'
    ),
    (
        'Gun Control',
        'Tulsi Gabbard',
        'I will uphold our constitutional right to bear arms while also upholding our responsibility to keep our children and communities safe.',
        'www.tulsi2020.com/issues/gun-second-amendment'
    ),
    (
        'Gun Control',
        'Joseph R. Biden Jr.',
        ' As a result of this effort, the Obama-Biden Administration took more than two dozen actions, including narrowing the so-called “gun show loophole,” increasing the number of records in the background check system, and expanding funding for mental health services.',
        'joebiden.com/gunsafety/'
    ),
    (
        'Climate Change',
        'Donald J. Trump',
        'President Trump protected the American homeland by enforcing immigration laws, so that every American can feel safe in their community.',
        'https://www.promiseskept.com/#'
    ),
    (
        'Climate Change',
        'William F. Weld',
        'Health care is a vital component of our lives that works best when we have the right kind of capitalism – the kind that produces more individual consumer choices for both costs and coverages, and more competition that drives prices down.',
        'weld2020.org/wp-content/uploads/2019/11/weld2020_policypaper_healthcare.pdf'),
    (
        'Climate Change',
        'Bernie Sanders',
        'The climate crisis is not only the single greatest challenge facing our country; it is also our single greatest opportunity to build a more just and equitable future, but we must act immediately.',
        'berniesanders.com/issues/green-new-deal/'
    ),
    (
        'Climate Change',
        'Tulsi Gabbard',
        'We can and must begin to build a renewable energy economy. By redirecting the billions spent every year subsidizing the fossil fuel industry to instead invest in the industries of the future — expanding wind, solar, and geothermal — we will guarantee a cleaner, safer energy future and create high-quality jobs.',
        'tulsi2020.com/issues/environment-green-economy'
    ),
    (
        'Climate Change',
        'Joseph R. Biden Jr.',
        'Biden believes the Green New Deal is a crucial framework for meeting the climate challenges we face. It powerfully captures two basic truths, which are at the core of his plan: (1) the United States urgently needs to embrace greater ambition on an epic scale to meet the scope of this challenge, and (2) our environment and our economy are completely and totally connected.',
        'joebiden.com/climate/'
    ),
    (
        'Trade and Tariffs',
        'Donald J. Trump',
        'By promoting fair and reciprocal trade, President Trump put America first. This includes exiting TPP, renegotiating NAFTA, and securing major new bilateral deals with major trading partners.',
        'https://www.promiseskept.com/#'
    ),
    (
        'Trade and Tariffs',
        'William F. Weld',
        'Health care is a vital component of our lives that works best when we have the right kind of capitalism – the kind that produces more individual consumer choices for both costs and coverages, and more competition that drives prices down.',
        'weld2020.org/wp-content/uploads/2019/11/weld2020_policypaper_healthcare.pdf'),
    (
        'Trade and Tariffs',
        'Bernie Sanders',
        'We need a trade policy that benefits American workers and creates living-wage jobs, not unfair trade agreements written by multi-national corporations.',
        'berniesanders.com/issues/fair-trade/'
    ),
    (
        'Trade and Tariffs',
        'Tulsi Gabbard',
        'On day one of my presidency, I will call a summit between the United States, China, and Russia to work to end this new Cold War, stop the arms race, reduce tensions, and increase cooperation going forward.',
        'www.tulsi2020.com/issues/war-diplomacy-international-trade'
    ),
    (
        'Trade and Tariffs',
        'Joseph R. Biden Jr.',
        'Instead of starting from scratch and getting rid of private insurance, he has a plan to build on the Affordable Care Act by giving Americans more choice, reducing health care costs, and making our health care system less complex to navigate.',
        'joebiden.com/healthcare/'
    ),
    (
        'Economy and Taxes',
        'Donald J. Trump',
        'President Trump jump-started America’s economy into record growth, which created jobs and increased take-home pay for working Americans. ',
        'https://www.promiseskept.com/#'
    ),
    (
        'Economy and Taxes',
        'William F. Weld',
        'The simple solution to this is technical education and retraining – we need to make community college and online college tuition available for workers who lose their jobs due to automation so they can get back to work and making money – indeed, at higher wagers than they had before.',
        'weld2020.org/wp-content/uploads/2019/11/weld2020_policypaper_economyandjobs.pdf'
    ),
    (
        'Economy and Taxes',
        'Bernie Sanders',
        'The wealthy and multinational corporations in this country will start paying their fair share of taxes. We are going to end austerity for working families, and provide some austerity for large, multinational corporations.',
        'berniesanders.com/issues/tax-increases-for-the-rich/'
    ),
    (
        'Economy and Taxes',
        'Tulsi Gabbard',
        'Millions of Americans have struggled since the 2008 Recession, but Wall Street hasn’t. The banks that were too big to fail then are even bigger today. The people who lost their homes, jobs and life savings were not bailed out like the banks were.',
        'www.tulsi2020.com/issues/economy-wall-street'
    ),
    (
        'Economy and Taxes',
        'Joseph R. Biden Jr.',
        ' Toward that end, Biden is calling for a transformational investment in our country’s infrastructure and future: $1.3 trillion over ten years, to equip the American middle class to compete and win in the global economy, to move the U.S. to net-zero greenhouse gas emissions, and to ensure that cities, towns, and rural areas all across our country share in that growth.',
        'https://joebiden.com/infrastructure/'
    );


INSERT INTO stateCode(state, code)
VALUES
('alabama', 'al'),
('alaska', 'ak'),
('american samoa', 'as'),
('arizona', 'az'),
('arkansas', 'ar'),
('california', 'ca'),
('colorado', 'co'),
('connecticut', 'ct'),
('delaware', 'de'),
('florida', 'fl'),
('georgia', 'ga'),
('guam', 'gu'),
('hawaii', 'hi'),
('idaho', 'id'),
('illinois', 'il'),
('indiana', 'in'),
('iowa', 'ia'),
('kansas', 'ks'),
('kentucky', 'ky'),
('louisiana', 'la'),
('maine', 'me'),
('maryland', 'md'),
('massachusetts', 'ma'),
('michigan', 'mi'),
('minnesota', 'mn'),
('mississippi', 'ms'),
('missouri', 'mo'),
('montana', 'mt'),
('nebraska', 'ne'),
('nevada', 'nv'),
('new hampshire', 'nh'),
('new jersey', 'nj'),
('new mexico', 'nm'),
('new york', 'ny'),
('north carolina', 'nc'),
('north dakota', 'nd'),
('north mariana islands', 'mp'),
('ohio', 'oh'),
('oklahoma', 'ok'),
('oregon', 'or'),
('pennsylvania', 'pa'),
('puerto rico', 'pr'),
('rhode island', 'ri'),
('south carolina', 'sc'),
('south dakota', 'sd'),
('tennessee', 'tn'),
('texas', 'tx'),
('u.s. virgin islands', 'vi'),
('utah', 'ut'),
('vermont', 'vt'),
('virginia', 'va'),
('washington', 'wa'),
('washington d.c.', 'dc'),
('west virginia', 'wv'),
('wisconsin', 'wi'),
('wyoming', 'wy');


INSERT INTO votingLocations(state, link, phone)
VALUES
('Alabama', 'https://myinfo.alabamavotes.gov/VoterView/RegistrantSearch.do', '(334) 242-7200'),
('Alaska', 'https://myvoterinformation.alaska.gov/', '(866) 952-8683'),
('Arizona', 'https://voter.azsos.gov/VoterView/RegistrantSearch.do', '(877) THE-VOTE'),
('Arkansas', 'https://www.voterview.ar-nova.org/VoterView/RegistrantSearch.do', '(800) 482-1127'),
('California', 'https://voterstatus.sos.ca.gov/', '(800) 345-8683'),
('Colorado', 'https://www.sos.state.co.us/voter-classic/pages/pub/olvr/findVoterReg.xhtml', '(303) 894-2200'),
('Connecticut', 'http://www.dir.ct.gov/sots/LookUp.aspx', '(860) 509-6100'),
('Delaware', 'https://ivote.de.gov/voterview', '(866) 276-2353'),
('District of Columbia', 'https://dcboe.org/Voters/Register-To-Vote/Check-Voter-Registration-Status', '(202) 727-2525'),
('Florida', 'http://registration.elections.myflorida.com/CheckVoterStatus', '(850) 245-6200'),
('Georgia', 'http://www.mvp.sos.ga.gov/MVP/mvp.do', '(404) 656-2871'),
('Hawaii', 'https://olvr.hawaii.gov', '(800) 442-VOTE (x 8683)'),
('Idaho', 'https://apps.idahovotes.gov/YourPollingPlace/AmIRegistered.aspx', '(208) 334-2852'),
('Illinois', 'https://ova.elections.il.gov/RegistrationLookup.aspx', '(217) 782-4141'),
('Indiana', 'https://indianavoters.in.gov/', '317-232-3939'),
('Iowa', 'https://sos.iowa.gov/elections/VoterReg/RegToVote/search.aspx', '(515) 281-8849'),
('Kansas', 'https://myvoteinfo.voteks.org/VoterView/RegistrantSearch.do', '(785) 296-4561'),
('Kentucky', 'https://vrsws.sos.ky.gov/VIC/', '(502) 573-7100'),
('Louisiana', 'https://voterportal.sos.la.gov/Home/VoterLogin', '(225) 922-0900'),
('Maine', 'http://www.maine.gov/portal/government/edemocracy/voter_lookup.php', '(207) 624-7736'),
('Maryland', 'https://voterservices.elections.maryland.gov/VoterSearch', '(410) 269-2840'),
('Massachusetts', 'https://www.sec.state.ma.us/VoterRegistrationSearch/MyVoterRegStatus.aspx', '(617) 727-2828'),
('Michigan', 'https://mvic.sos.state.mi.us/', '(888) 767-6424'),
('Minnesota', 'https://www.msegov.com/sos/voter_registration/amiregistered/Search', '(877) 600-VOTE'),
('Mississippi', 'http://www.sos.ms.gov/elections-voting/pages/voter-registration-information.aspx', '(800) 829-6786'),
('Missouri', 'http://www.sos.mo.gov/elections/voterlookup/', '(573) 751-2301'),
('Montana', 'https://app.mt.gov/voterinfo/', '(888) 884-VOTE'),
('Nebraska', 'https://www.votercheck.necvr.ne.gov/VoterView/RegistrantSearch.do', '(888) 727-0007'),
('Nevada', 'https://nvsos.gov/votersearch/', '(775) 684-5708'),
('New Hampshire', 'http://sos.nh.gov/VoteInforLook.aspx', '(603) 271-3242'),
('New Jersey', 'https://voter.njsvrs.com/PublicAccess/servlet/com.saber.publicaccess.control.PublicAccessNavigationServlet?USERPROCESS=PublicSearch', '(609) 292-3760'),
('New Mexico', 'https://voterportal.servis.sos.state.nm.us/WhereToVote.aspx', '(505) 827-3600'),
('New York', 'https://voterlookup.elections.ny.gov/', '(518) 474-6220'),
('North Carolina', 'https://vt.ncsbe.gov/RegLkup/', '(919) 814-0700'),
('North Dakota', 'https://vip.sos.nd.gov/WhereToVoteID.aspx?tab=VoterLookup&ptlPKID=7&ptlhPKID=51', '(701) 328-4146'),
('Ohio', 'https://voterlookup.ohiosos.gov/voterlookup.aspx', '(614) 466-2585'),
('Oklahoma', 'https://okvoterportal.okelections.us/', '(405) 521-2391'),
('Oregon', 'https://secure.sos.state.or.us/orestar/vr/showVoterSearch.do?source=SOS', '(503) 986-1518'),
('Pennsylvania', 'https://www.pavoterservices.state.pa.us/Pages/VoterRegistrationStatus.aspx', '(877) 868-3772'),
('Rhode Island', 'https://vote.sos.ri.gov/Home/UpdateVoterRecord?ActiveFlag=0', '(401) 222-2345'),
('South Carolina', 'https://info.scvotes.sc.gov/eng/voterinquiry/VoterInformationRequest.aspx?PageMode=VoterInfo', '(803) 734-9060'),
('South Dakota', 'https://vip.sdsos.gov/viplogin.aspx', '(605) 773-3537'),
('Tennessee', 'https://tnmap.tn.gov/voterlookup/', '(615) 741-7956'),
('Texas', 'https://teamrv-mvp.sos.texas.gov/MVP/mvp.do', '(800) 252-VOTE'),
('Utah', 'https://votesearch.utah.gov/voter-search/search/search-by-voter/voter-info', '(801) 538-1041'),
('Vermont', 'https://mvp.sec.state.vt.us/', '(802) 828-2464'),
('Virginia', 'https://elections.virginia.gov/citizen-portal/', '(800) 552-9745'),
('Washington', 'https://voter.votewa.gov/WhereToVote.aspx', '(800) 448-4881'),
('West Virginia', 'https://apps.sos.wv.gov/elections/voter/index.aspx', '(304) 558-6000'),
('Wisconsin', 'https://myvote.wi.gov/en-us/MyVoterInfo', '(608) 266-8005'),
('Wyoming', 'http://soswy.state.wy.us/Elections/PollPlace/default.aspx', '(307) 777-5860');
