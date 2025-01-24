Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BF1A1BEF7
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 25 Jan 2025 00:18:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tbSwp-0003sn-64
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 24 Jan 2025 23:18:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1tbSwB-0003rE-W4
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 24 Jan 2025 23:18:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hSjQCxfURjm/N120rDPiEtMw0TSoItdzlmo/GpKazxQ=; b=dxIx24zTytseOsNgJTh7x1P0HD
 cbZNWBN/oQBvpFw+5MaIevGJXfNSnmQuobfmycBMh2ahM8u7UhTMePKdX1AjmL+VaB0bIjOHK2mX6
 QCsc3+gGj4sEIiGwPMAqZWU3520aLviJOZt757NUVsOa3U9GCsA3fP0PIH390fFp7EZc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hSjQCxfURjm/N120rDPiEtMw0TSoItdzlmo/GpKazxQ=; b=jNM2VJJCavq98Q10enE7cPhC65
 o2gDF8NnrHLBbe+RN1VbIblJXL+OzmkUR9Q+2ndozZ4soqjdMSAaa3Rb65SumCkTRYZgI0rgCE37R
 uTCSSJTW6J3S0Hxqqay2av+DSnDZznuVSIYBqjInLd7QDbLYBk/XTQxo9s8Z7whNA7Z8=;
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tbSw2-0003tZ-LV for kgdb-bugreport@lists.sourceforge.net;
 Fri, 24 Jan 2025 23:17:59 +0000
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5401c52000dso2674950e87.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 24 Jan 2025 15:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737760669; x=1738365469;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hSjQCxfURjm/N120rDPiEtMw0TSoItdzlmo/GpKazxQ=;
 b=kp5d9aOwmwte2vgnnrhtGG3Ab9Lsl8q9zFtLg2JnCqb5lEBrCa0VsqrSVxOSzVGSIU
 iv09iv257Xl1wNaslt1miGBAqSmr67DT9/LK6SRZVLoVi6zg5zFtCojtfmz5ECbON/dn
 xwmP4TMzfW2aJrvKMG+m7HRzYbJD8+JwZ9yek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737760669; x=1738365469;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hSjQCxfURjm/N120rDPiEtMw0TSoItdzlmo/GpKazxQ=;
 b=xFuqVzV1E914oaynbOxnAc0knmM5uca7JRUcsV7nr5z+4Ecw/yrgQWP1ldIaZ0kEWa
 M7LtwUMvU4GcV1tb+9SE21kV5c6+PVzVvWYd/G6FVz71Ee7G1BvJDHHgme8wIwRpLwt3
 ZyDhl0VS5SgfnmuieCTxZmPSB4PrMuGoTgShmY7NaMRr03GF3osFZaakbHAz70yKfsU6
 npiJ2tUNhoFxiOs3SaGWvfHf5rYQ8z6o8oeQHH4bJ3G9k7i55hniGUDBxr/ec+ynfA1p
 koJXKrh0lGxx86L7Qe3qcbGlT3WJEEtG6Ken/p9K1iLNxkyLJdMt9YqczTCdEriAkggM
 i15g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXsxgnHb3w/FwsMMqNkcGL/7b7V6tW+UAhXuaLTnK7aKFyaZ+5CzU7ZBC2zGsAwRnZGg6d00e/miEoEnKXew==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyMj3jqZRpgvxX6Q/QML4kpEHEBxUhdwM3ci8sRPvsqF3Yg4rJM
 rgP+NzugOoYfHmVpC3M3GBOmHDvaPEKTypaOQBDHjaWggnedmS00hDbrU+7qLDEses2h50O7vAP
 anw==
X-Gm-Gg: ASbGnctsQxIV1KbZiWe+uNJFluMY2IhUyH2LmrJcJdw+uzVs5URXQVXkawUnwxouDF4
 nqbp5wfnWtz6d6uLHKel7KN9UFyZTw4Y/Z9+sGegUHMV6/S4VyjjNG8dyMA7jvYB/dRCXergp0R
 OqKbs6zwGod9V6067wk7CTLRoxVGQcCQmZhpDaPe1Idvjo1eM4VckyeNvHmisoL3MRBbGZUxiRL
 sIy34bI5+M2em9S+yheFmco3fQ2w3AhOlnUKcOVNTdj7vE70dDOO+YE/edTVxZKD+GugpQgR+EB
 zmjaSz14ZUUIrvldVUxg4A6Dm+kFhGAgETAh82brYNGS
X-Google-Smtp-Source: AGHT+IGBekgSAoTjmq70uxb5uTWSA9U3tZyjn1d6ujM7ggBZBFbZ64kRLGSSa+PE9Vuhezw5MEWOaA==
X-Received: by 2002:a05:6512:ad2:b0:542:97b9:89dd with SMTP id
 2adb3069b0e04-5439c218d8amr9547458e87.2.1737760669389; 
 Fri, 24 Jan 2025 15:17:49 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8379493sm442596e87.161.2025.01.24.15.17.44
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 15:17:46 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53e399e3310so2829193e87.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 24 Jan 2025 15:17:44 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXst9z3QZWL9Ek2BWXmAbuLftWRkItX2vUbo9vN0ofZLwAPR3MnojUoI+vABOYY1oBk/tm+5FZ+RTi/L97TLg==@lists.sourceforge.net
X-Received: by 2002:a05:6512:6c3:b0:542:28a9:dca2 with SMTP id
 2adb3069b0e04-5439c269841mr12558697e87.39.1737760664298; Fri, 24 Jan 2025
 15:17:44 -0800 (PST)
MIME-Version: 1.0
References: <20241211153955.33518-1-tjarlama@gmail.com>
 <20241211153955.33518-2-tjarlama@gmail.com>
 <CAD=FV=Xz2QqqTT+1Rmqq8hVEqQeF5-X=vgXKOjFe=y9FQVuDAQ@mail.gmail.com>
 <CAOfKSRMBYp6dSbhRqQXm09QUoJTaLjQr0XFqzqGVGeJ-KKoMuQ@mail.gmail.com>
In-Reply-To: <CAOfKSRMBYp6dSbhRqQXm09QUoJTaLjQr0XFqzqGVGeJ-KKoMuQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 24 Jan 2025 15:17:32 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VVHNNE3jK+_Vh5ydxysqMnHdZujG7y9=Gxrms8D_msBw@mail.gmail.com>
X-Gm-Features: AWEUYZn5qEtP1U9GOHM2S8c3LHoKvZnC1WnJRVkmjviAh_Ztkivn_ls9Oth-ddg
Message-ID: <CAD=FV=VVHNNE3jK+_Vh5ydxysqMnHdZujG7y9=Gxrms8D_msBw@mail.gmail.com>
To: Amal <tjarlama@gmail.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Jan 13, 2025 at 8:09 AM Amal <tjarlama@gmail.com>
    wrote: > > On Fri, Dec 13, 2024 at 12:55 AM Doug Anderson <dianders@chromium.org>
    wrote: > > > > Hi, > > > > On Wed, Dec 11, 2024 at 7:40� [...] 
 
 Content analysis details:   (-3.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.53 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.167.53 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.167.53 listed in sa-trusted.bondedsender.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.53 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tbSw2-0003tZ-LV
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/3] kgdb: Add kgdb_mem2ebin
 function for converting memory to binary format
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: kgdb-bugreport@lists.sourceforge.net,
 Stephen Brennan <stephen.s.brennan@oracle.com>, Amal Raj T <amalrajt@meta.com>,
 Daniel Thompson <danielt@kernel.org>,
 linux-serial <linux-serial@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Omar Sandoval <osandov@osandov.com>,
 linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIEphbiAxMywgMjAyNSBhdCA4OjA54oCvQU0gQW1hbCA8dGphcmxhbWFAZ21h
aWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgRGVjIDEzLCAyMDI0IGF0IDEyOjU14oCvQU0gRG91
ZyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+Cj4gPiBIaSwKPiA+
Cj4gPiBPbiBXZWQsIERlYyAxMSwgMjAyNCBhdCA3OjQw4oCvQU0gQW1hbCBSYWogVCA8dGphcmxh
bWFAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gRnJvbTogQW1hbCBSYWogVCA8YW1hbHJh
anRAbWV0YS5jb20+Cj4gPiA+Cj4gPiA+IEFkZCBhIG5ldyBmdW5jdGlvbiBrZ2RiX21lbTJlYmlu
IHRoYXQgY29udmVydHMgbWVtb3J5Cj4gPiA+IHRvIGJpbmFyeSBmb3JtYXQsIGVzY2FwaW5nIHNw
ZWNpYWwgY2hhcmFjdGVycwo+ID4gPiAoJyQnLCAnIycsIGFuZCAnfScpLiBrZ2RiX21lbTJlYmlu
IGZ1bmN0aW9uIGVuc3VyZXMKPiA+ID4gdGhhdCBtZW1vcnkgZGF0YSBpcyBwcm9wZXJseSBmb3Jt
YXR0ZWQgYW5kIGVzY2FwZWQKPiA+ID4gYmVmb3JlIGJlaW5nIHNlbnQgb3ZlciB0aGUgd2lyZS4g
QWRkaXRpb25hbGx5LCB0aGlzCj4gPiA+IGZ1bmN0aW9uIHJlZHVjZXMgdGhlIGFtb3VudCBvZiBk
YXRhIGV4Y2hhbmdlZCBiZXR3ZWVuCj4gPiA+IGRlYnVnZ2VyIGNvbXBhcmVkIHRvIGhleC4KPiA+
ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQW1hbCBSYWogVCA8YW1hbHJhanRAbWV0YS5jb20+Cj4g
PiA+IC0tLQo+ID4gPiAgaW5jbHVkZS9saW51eC9rZ2RiLmggICB8ICAxICsKPiA+ID4gIGtlcm5l
bC9kZWJ1Zy9nZGJzdHViLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4g
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKCkZXSVcsIGl0IGxvb2tzIGxp
a2UgU3RlcGhlbiBoYXMgYWxyZWFkeSByZXNwb25kZWQgdG8geW91ciBWMyBhbmQgdGhlCnByb3Rv
Y29sIG1pZ2h0IGNoYW5nZSBhIGJ1bmNoLiBJJ20gbm90IGdvaW5nIHRvIGRvIGEgZGV0YWlsZWQg
cmV2aWV3Cm9uIGl0IGF0IHRoaXMgdGltZS4gSSdsbCBjb21tZW50IG9uIGEgZmV3IG9mIHRoZSB0
aGluZ3MgYmVsb3csIHRob3VnaC4KCk9uZSBvdGhlciBub3RlIGlzIHRoYXQgeW91IHNob3VsZCBo
YXZlIGRvbmUgYSAicmVwbHkgdG8gYWxsIiB3aGVuCnJlc3BvbmRpbmcgdG8gbXkgcmV2aWV3IGZl
ZWRiYWNrLCBub3QganVzdCBhIHJlcGx5IHRvIG1lLiBUaGUKcmVzcG9uc2VzIHNob3VsZCBiZSBh
cmNoaXZlZCBvbiB0aGUgbGlzdHMgdW5sZXNzIHRoZXJlIHdhcyBhIHNwZWNpZmljCnJlYXNvbiB0
byBleGNsdWRlIHRoZW0uIEFkZGluZyB0aGUgbGlzdHMgYmFjayBoZXJlIHNpbmNlIEkgZG9uJ3Qg
c2VlCmFueXRoaW5nIHNlbnNpdGl2ZSBpbiB5b3VyIHJlcGx5LgoKCj4gPiA+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L2tnZGIuaCBiL2luY2x1ZGUvbGludXgva2dkYi5oCj4gPiA+IGluZGV4
IDc2ZTg5MWVlOWUzNy4uZmEzY2YzOGExNGRlIDEwMDY0NAo+ID4gPiAtLS0gYS9pbmNsdWRlL2xp
bnV4L2tnZGIuaAo+ID4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2tnZGIuaAo+ID4gPiBAQCAtMzIy
LDYgKzMyMiw3IEBAIGV4dGVybiBzdHJ1Y3Qga2dkYl9pbyAqZGJnX2lvX29wczsKPiA+ID4KPiA+
ID4gIGV4dGVybiBpbnQga2dkYl9oZXgybG9uZyhjaGFyICoqcHRyLCB1bnNpZ25lZCBsb25nICps
b25nX3ZhbCk7Cj4gPiA+ICBleHRlcm4gY2hhciAqa2dkYl9tZW0yaGV4KGNoYXIgKm1lbSwgY2hh
ciAqYnVmLCBpbnQgY291bnQpOwo+ID4gPiArZXh0ZXJuIGNoYXIgKmtnZGJfbWVtMmViaW4oY2hh
ciAqbWVtLCBjaGFyICpidWYsIGludCBjb3VudCk7Cj4gPiA+ICBleHRlcm4gaW50IGtnZGJfaGV4
Mm1lbShjaGFyICpidWYsIGNoYXIgKm1lbSwgaW50IGNvdW50KTsKPiA+ID4KPiA+ID4gIGV4dGVy
biBpbnQga2dkYl9pc3JlbW92ZWRicmVhayh1bnNpZ25lZCBsb25nIGFkZHIpOwo+ID4gPiBkaWZm
IC0tZ2l0IGEva2VybmVsL2RlYnVnL2dkYnN0dWIuYyBiL2tlcm5lbC9kZWJ1Zy9nZGJzdHViLmMK
PiA+ID4gaW5kZXggZjYyNTE3MmQ0YjY3Li42MTk4ZDJlYjQ5YzQgMTAwNjQ0Cj4gPiA+IC0tLSBh
L2tlcm5lbC9kZWJ1Zy9nZGJzdHViLmMKPiA+ID4gKysrIGIva2VybmVsL2RlYnVnL2dkYnN0dWIu
Ywo+ID4gPiBAQCAtMjU3LDYgKzI1NywzNyBAQCBjaGFyICprZ2RiX21lbTJoZXgoY2hhciAqbWVt
LCBjaGFyICpidWYsIGludCBjb3VudCkKPiA+ID4gICAgICAgICByZXR1cm4gYnVmOwo+ID4gPiAg
fQo+ID4gPgo+ID4gPiArLyoKPiA+ID4gKyAqIENvbnZlcnQgbWVtb3J5IHRvIGJpbmFyeSBmb3Jt
YXQgZm9yIEdEQiByZW1vdGUgcHJvdG9jb2wKPiA+ID4gKyAqIHRyYW5zbWlzc2lvbiwgZXNjYXBp
bmcgc3BlY2lhbCBjaGFyYWN0ZXJzICgkLCAjLCBhbmQgfSkuCj4gPgo+ID4gV2h5IGV4YWN0bHkg
YXJlIHRob3NlIGNoYXJhY3RlcnMgc3BlY2lhbD8gV2hhdCBjb25zaWRlcnMgdGhlbSBzcGVjaWFs
Cj4gPiBhbmQgc28gd2h5IGRvIHlvdSBuZWVkIHRvIGVzY2FwZSB0aGVtPyBJIGd1ZXNzIHlvdSBy
ZWFsbHkganVzdCBjYXJlCj4gPiBhYm91dCBhdm9pZGluZyAjIGFuZCAkIGFuZCB5b3UncmUgdXNp
bmcgJ30nIGFzIHlvdXIgZXNjYXBlIGNoYXJhY3Rlcgo+ID4gc28geW91IG5lZWQgdG8gZXNjYXBl
IHRoYXQgdG9vPwo+ID4KPiA+IFlvdXIgZnVuY3Rpb24gY29tbWVudCBzaG91bGQgZGVzY3JpYmUg
dGhlIGVzY2FwaW5nIG1ldGhvZCBhbmQgaWRlYWxseQo+ID4gcHJvdmlkZSBhIGZldyBleGFtcGxl
cy4KPiA+Cj4gPgo+IEFkZGVkIHJlbGV2YW50IGxpbmtzIGluIHRoZSBjb21taXQgbWVzc2FnZSBh
bmQgY29tbWVudGVkIHR3byBleGFtcGxlcwo+IGluIGNvZGUKPiA+ID4gKyAqLwo+ID4gPiArY2hh
ciAqa2dkYl9tZW0yZWJpbihjaGFyICptZW0sIGNoYXIgKmJ1ZiwgaW50IGNvdW50KQo+ID4KPiA+
IE9uZSBvZiB0aGUgdHdvIGJ1ZmZlcnMgc2VlbXMgbGlrZSBpdCBzaG91bGQgYmUgImNvbnN0Iiwg
cmlnaHQ/IFRoYXQKPiA+IHdvdWxkIGhlbHAgZG9jdW1lbnQgd2hpY2ggd2FzIGlucHV0IGFuZCB3
aGljaCB3YXMgb3V0cHV0LiBJIGd1ZXNzCj4gPiAibWVtIiBpcyB0aGUgaW5wdXQ/Cj4gPgo+ID4g
ImNvdW50IiBzaG91bGQgYmUgInNpemVfdCIKPiA+Cj4gVGhpcyB3YXMgY29waWVkIGZyb20gYGtn
ZGJfbWVtMmhleGAgd2hpY2ggdXNlcyBhIHNpbWlsYXIgdGVtcGxhdGUuCj4gU2hvdWxkIHdlIGNv
bnRpbnVlIHVzaW5nIGBpbnRgIG9yIGp1c3QgdGhpcyBmdW5jdGlvbiBuZWVkIHRvIGJlIG1pZ3Jh
dGVkIHRvCj4gYHNpemVfdGAKCkluIGdlbmVyYWwgdGhlIGV4aXN0aW5nIGtkYi9rZ2RiIGZ1bmN0
aW9ucyBhcmUgbm90IGFsd2F5cyB0aGUgYmVzdApleGFtcGxlcy4gSSB0aGluayBzaXplX3QgaXMg
Y29ycmVjdCBoZXJlLiBJbmRlZWQsIGlmIHlvdSBsb29rIGF0IHdoYXQKImtnZGJfbWVtMmhleCIg
ZG9lcyB3aXRoICJjb3VudCIgaXQgcGFzc2VzIGl0IHRvCmNvcHlfZnJvbV9rZXJuZWxfbm9mYXVs
dCgpIHdoaWNoIHRha2VzIGEgc2l6ZV90LgoKRmVlbCBmcmVlIHRvIHBvc3QgYSAoc2VwYXJhdGUp
IHBhdGNoIGZpeGluZyBrZ2RiX21lbTJoZXgoKS4KCgo+ID4gUHJlc3VtYWJseSB0aGVyZSBzaG91
bGQgYmUgdHdvIGNvdW50cyB0YWxraW5nIGFib3V0IHRoZSBzaXplcyBvZiBlYWNoCj4gPiBidWZm
ZXIsIG9yIGF0IGxlYXN0IHNvbWUgZG9jdW1lbnRhdGlvbiBzaG91bGQgYmUgaW4gdGhlIGZ1bmN0
aW9uCj4gPiBjb21tZW50IHRhbGtpbmcgYWJvdXQgdGhlIGZhY3QgdGhhdCAiYnVmIiBuZWVkcyB0
byBiZSB0d2ljZSB0aGUgc2l6ZT8KPiA+Cj4gPgo+ID4gPiArewo+ID4gPiArICAgICAgIGNoYXIg
KnRtcDsKPiA+ID4gKyAgICAgICBpbnQgZXJyOwo+ID4gPiArCj4gPiA+ICsgICAgICAgdG1wID0g
YnVmICsgY291bnQ7Cj4gPgo+ID4gQ291bGQgdXNlIGEgY29tbWVudCB0aGF0IHRoZSBidWZmZXIg
bmVlZHMgdG8gYmUgMnggbG9uZyB0byBoYW5kbGUKPiA+IGVzY2FwaW5nIGFuZCB0aGF0IHlvdSds
bCB1c2UgdGhlIDJuZCBoYWxmIGFzIGEgdGVtcCBidWZmZXIuCj4gPgo+ID4KPiBEb25lLCBjb21t
ZW50ZWQgaW4gdjMKPiA+ID4gKwo+ID4gPiArICAgICAgIGVyciA9IGNvcHlfZnJvbV9rZXJuZWxf
bm9mYXVsdCh0bXAsIG1lbSwgY291bnQpOwo+ID4gPiArICAgICAgIGlmIChlcnIpCj4gPiA+ICsg
ICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+ID4gKyAgICAgICB3aGlsZSAoY291bnQgPiAw
KSB7Cj4gPgo+ID4gSWYgeW91IGNoYW5nZSBgY291bnRgIHRvIGBzaXplX3RgIHRoZSBhYm92ZSB0
ZXN0IHdvbid0IHdvcmsgYmVjYXVzZQo+ID4gaXQnbGwgYmUgdW5zaWduZWQuIFN0aWxsIHByb2Jh
Ymx5IGJldHRlciB0byB1c2UgYHNpemVfdGAsIGJ1dCBqdXN0IGEKPiA+IHdhcm5pbmcgdGhhdCB5
b3UnbGwgaGF2ZSB0byBjaGFuZ2UgdGhlIGNvbmRpdGlvbi4KPiA+Cj4gPgo+ID4gPiArICAgICAg
ICAgICAgICAgdW5zaWduZWQgY2hhciBjID0gKnRtcDsKPiA+ID4gKwo+ID4gPiArICAgICAgICAg
ICAgICAgaWYgKGMgPT0gMHg3ZCB8fCBjID09IDB4MjMgfHwgYyA9PSAweDI0KSB7Cj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICpidWYrKyA9IDB4N2Q7Cj4gPgo+ID4gRG9uJ3QgaGFyZGNv
ZGUuIE11Y2ggYmV0dGVyIHRvIHVzZSAnfScsICcjJywgJyQnCj4gPgo+IEZpeGVkIGluIHYzCj4g
Pgo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAqYnVmKysgPSBjIF4gMHgyMDsKPiA+ID4g
KyAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICpi
dWYrKyA9IGM7Cj4gPiA+ICsgICAgICAgICAgICAgICB9Cj4gPiA+ICsgICAgICAgICAgICAgICBj
b3VudCAtPSAxOwo+ID4gPiArICAgICAgICAgICAgICAgdG1wICs9IDE7Cj4gPgo+ID4gY291bnQt
LTsKPiA+IHRtcCsrOwo+ID4KPiBGaXhlZCBpbiB2Mwo+ID4gPiArICAgICAgIH0KPiA+ID4gKyAg
ICAgICAqYnVmID0gMDsKPiA+Cj4gPiBXaHkgaXMgdGhlIHJlc3VsdGluZyBidWZmZXIgJ1wwJyB0
ZXJtaW5hdGVkIHdoZW4gdGhlIHNvdXJjZSBidWZmZXIKPiA+IGlzbid0PyBBZGRpbmcgdGhpcyB0
ZXJtaW5hdGlvbiBtZWFucyB0aGF0IHRoZSBkZXN0aW5hdGlvbiBidWZmZXIgbmVlZHMKPiA+IHRv
IGJlIDEgYnl0ZSBiaWdnZXIsIHJpZ2h0Pwo+ID4KPiA+IC4uLm9yIG1heWJlIHRoZSBzb3VyY2Ug
YnVmZmVyIGRvZXNuJ3QgYWN0dWFsbHkgaGF2ZSBhbnkgZW1iZWRkZWQgJ1wwJwo+ID4gY2hhcmFj
dGVycyBhbmQgeW91J3JlIHVzaW5nIHRoaXMgZm9yIHRlcm1pbmF0aW9uIHRvIHRoZSBvdGhlciBz
aWRlPyBJdAo+ID4gd291bGQgYmUgZ29vZCB0byBjbGFyaWZ5Lgo+ID4KPiA+IEluIG90aGVyIHdv
cmRzLCBpZiB0aGUgaW5wdXQgaXMgMiBieXRlcyBiaWc6Cj4gPiAnfX0nCj4gPgo+ID4gVGhlIG91
dHB1dCBidWZmZXIgd2lsbCBiZSA1IGJ5dGVzIGJpZzoKPiA+ICd9XX1dXDAnCj4gPgo+IERvbid0
IHRoaW5rIG51bGwgdGVybWluYXRpb24gaXMgcmVxdWlyZWQgaW4gdGhpcyBjYXNlLgo+IEluIHRo
aXMgY2FzZSwgdGhlIGBnZGJfc2VyaWFsX3N0dWJgIGFscmVhZHkgaW5pdGlhbGl6ZXMgdGhlIGJ1
ZmZlciB3aXRoIGBcMGAsCj4gYW5kIGBwdXRfcGFja2V0YCBpdGVyYXRlcyBvdmVyIHRoZSBidWZm
ZXIgdW50aWwgdGhlIGZpcnN0IG9jY3VycmVuY2Ugb2YgXDAuCj4gVGhpcyB3b3JrcyBmb3IgYHZt
Y29yZWluZm9gIHF1ZXJ5LiBCdXQgZm9yIGlucHV0IGJ1ZmZlcnMgd2l0aCBhZGRpdGlvbmFsCj4g
YFwwYCBjaGFyYWN0ZXJzIG5lZWQgdG8gYmUgZXNjYXBlZCwgdG8gbWFrZSBzdXJlIGBwdXRfcGFj
a2V0YCBwYXJzZWQgdGhlCj4gZW50aXJlIGJ1ZmZlci4KPiA+ID4gKwo+ID4gPiArICAgICAgIHJl
dHVybiBidWY7Cj4gPgo+ID4gV2hhdCBleGFjdGx5IGlzIHRoaXMgcmV0dXJuIHZhbHVlPyBJdCBw
b2ludHMgcmlnaHQgcGFzdCB0aGUgZW5kIG9mIHRoZSBidWZmZXI/Cj4gPgo+ID4gWW91IHNlZW0g
dG8ganVzdCB1c2UgaXQgYXMgYW4gZXJyb3IgdmFsdWUgKE5VTEwgbWVhbnMgZXJyb3IsIG5vbi1O
VUxMCj4gPiBtZWFucyBubyBlcnJvcikuIFdoeSBub3QgcmV0dXJuIGFuIGVycm9yIGNvZGUgdGhl
bj8KPiA+Cj4gT3RoZXIgZW5jb2RlcnMgYWxzbyByZXR1cm4gYSBgY2hhciAqYC4gSG93ZXZlciB0
aGVyZSBpcyBubyBlcnJvciBoYW5kbGluZwo+IGFueXdoZXJlLCB0aGUgcmV0dXJuIHZhbHVlIGlz
IGRpc2NhcmRlZCBhdCB0aGUgY2FsbGVyIHNpZGUuCgpBcyBwZXIgYWJvdmUsIGV4aXN0aW5nIGtk
Yi9rZ2RiIGNvZGUgaXNuJ3QgYWx3YXlzIHRoZSBiZXN0IGV4YW1wbGUgdG8KZm9sbG93LiBQZXJz
b25hbGx5IEknZCByYXRoZXIgc2VlIGFuIGVycm9yIGNvZGUgcmV0dXJuZWQgdW5sZXNzCnRoZXJl
J3MgYSBnb29kIHJlYXNvbiBub3QgdG8uCgpJZiB5b3UgcmVhbGx5IHdhbnQgdG8gcmV0dXJuIGEg
cG9pbnRlciBsaWtlIHRoaXMsIGEgYmFyZSBtaW5pbXVtIHdvdWxkCmJlIHRvIGRvY3VtZW50IGl0
LiBUaGUga2dkYl9tZW0yaGV4KCkgZnVuY3Rpb24geW91IHBvaW50ZWQgdG8gX2RvZXNfCmF0IGxl
YXN0IGRvY3VtZW50IHdoYXQgaXMgcmV0dXJuZWQuCgotRG91ZwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlz
dApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
