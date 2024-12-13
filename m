Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E599F0150
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 13 Dec 2024 01:56:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tLtyQ-0002ku-O0
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 13 Dec 2024 00:56:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1tLtyD-0002kI-A6
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Dec 2024 00:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WcTT0FmNV2c5bD1oBd/LU2lmJVRRZF1Sdah2uNcst1c=; b=K7rNndTlSv2U78cvpGgJI+G+fE
 5WOQ/q1Cye/pXIfBuGnrjobUu5US1ZfsfmgGDvHqvhYzknQCaqYLstZYHosP+R9URHzom7ow7+zaV
 N7pdPuHmSLvtNSG5PnC+8qHHcIGck1G6B9GoOmGlGrZo+DQGafz31bzGLnf7w3kwj1ec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WcTT0FmNV2c5bD1oBd/LU2lmJVRRZF1Sdah2uNcst1c=; b=alV/rOucXo/mFpQPpQX2cN7XJy
 Lb8WbIVdkZHh6ztj0whTB84UAo0a4MZmxz3znhVxZDWMfX2AJQrKmwCpDRDL/K+sQkpAudl6VMbSE
 +E7uvvdivtK1k1ebDsZZYmrLDGByUXHBZwGz1C5M8/fh+uKPHB+gD08sCIL0UQM/io7g=;
Received: from mail-lf1-f48.google.com ([209.85.167.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tLty7-00045z-NH for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Dec 2024 00:55:48 +0000
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5401b7f7141so1050558e87.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 12 Dec 2024 16:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734051341; x=1734656141;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WcTT0FmNV2c5bD1oBd/LU2lmJVRRZF1Sdah2uNcst1c=;
 b=eWbOer7jAXVq0kz5PSd17SKrc11fNY0Y96UooSl6jurwV3xDDPva2mRnJTA+5VLne6
 hvxQFUCQlM4g4UMjVC6/gnnQ8eFvdUKt5P7otP85lnKp2yIaJWb8dHD7T5SUrHCGvyhf
 JDIVANUn2lZP5mxnfXxTMg98fW5QcdkpKQ5r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734051341; x=1734656141;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WcTT0FmNV2c5bD1oBd/LU2lmJVRRZF1Sdah2uNcst1c=;
 b=WNMh9ptbWLYRTBPnUphIq54HIbllc+nTpYlZK8NDcmFw3RKlCtoe415Gp3cmxU0+SO
 IdX/UM9EAQEzkDGtJcEtETyxwdZW+fATdWS0dR8t1WQEOdaXGgHhiv+dtACVqpswb0uE
 Sdz97vYbSJW6B0N2cILrrTeGaUQUDE+nQtWq/z14gJXh1G+p6xHMpnfoZkpJgp1gTB+d
 RM3bqD0l/5DIIx4sfSw7mFWNqSrDLXkgGcIOH3eOvNc4Z568f7g0Kzk6ySj9ej/z9/CU
 CaXG2638E1wIiJjclOZ+n2bIhwVdzYY8MCITXbhpThof3b7HYjmw2CEWrI63HhGfrQBE
 tHpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxPWrwV+LKI9+zEeHf5cXvBBaDwvZLIpnJ0XB8MO9LQmuUrhpDj+UHfMXvnAjehpz96ZyqKRuKf2trZptl2A==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzWLNBLp88g5xDjoDh/Lf6PsbU9732pL/9pp/J4UrhGvxEsSsdm
 dOZmbhrfB1FMs7GyytVCQFG0C5vZI1MEZm3MWHh6keadUaVQkaXcS0SA/srfaoyypA7UMIftuqg
 53A==
X-Gm-Gg: ASbGncuWkvQSyNAACi7+X4C5LvZXvryp5zAImFJnsN6AGf3z8VdImW81QVeqwnT8IEH
 gJJEq1Y++vfBj8gmnTY8AxwapWJZQjQICY1G1aAPesK+3IOqzRN1h6n9QrljASwTzjkIGkcIuCH
 w0o4a0djbMasl7fWZZrr/CWdNz+otRDnkn0LyxFAYazFWcCWsSHhntsxfGDriLy9dl9AJ4Wbh/L
 MhuGIjn4jM4879qFWbDlfpWvTT27kUdWr4a/BrOyvvKc1/UZkUFvSwb3cHill7fwihe7XZJO4jn
 KkC51d0OCB7Pii6c5ltQTHl2
X-Google-Smtp-Source: AGHT+IGzlvY+vyyCxgahPZMZo7W0zzdXpg2YQf7Gjp+72/KO86hInQXIjffb954lX7VzRVbVcONwSg==
X-Received: by 2002:a05:6512:e95:b0:53e:3804:57ae with SMTP id
 2adb3069b0e04-54099b71b0amr134595e87.51.1734051340615; 
 Thu, 12 Dec 2024 16:55:40 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54021507a60sm1294633e87.281.2024.12.12.16.55.39
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 16:55:39 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-3022484d4e4so12620141fa.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 12 Dec 2024 16:55:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVij0IbHhjyf1aRG8w5BiGwqlAE/5539S/Ib5up81ykOlEiwiO2EzmgrcqqhW36TS1NTYsmnfoNg1pqMJEO2Q==@lists.sourceforge.net
X-Received: by 2002:a05:651c:154a:b0:301:12:1ed6 with SMTP id
 38308e7fff4ca-3025443fd1emr2004261fa.11.1734051339191; Thu, 12 Dec 2024
 16:55:39 -0800 (PST)
MIME-Version: 1.0
References: <20241211153955.33518-1-tjarlama@gmail.com>
 <20241211153955.33518-2-tjarlama@gmail.com>
In-Reply-To: <20241211153955.33518-2-tjarlama@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Dec 2024 16:55:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xz2QqqTT+1Rmqq8hVEqQeF5-X=vgXKOjFe=y9FQVuDAQ@mail.gmail.com>
X-Gm-Features: AbW1kvbEOd0BlJ40yO5tbFJkxTLqckOiZmGfJuwh68hNQBkDbIpadlljHlKbfMk
Message-ID: <CAD=FV=Xz2QqqTT+1Rmqq8hVEqQeF5-X=vgXKOjFe=y9FQVuDAQ@mail.gmail.com>
To: Amal Raj T <tjarlama@gmail.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Dec 11, 2024 at 7:40 AM Amal Raj T <tjarlama@gmail.com>
    wrote: > > From: Amal Raj T <amalrajt@meta.com> > > Add a new function kgdb_mem2ebin
    that converts memory > to binary format, escaping [...] 
 
 Content analysis details:   (-0.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.167.48 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.48 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.48 listed in wl.mailspike.net]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.167.48 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tLty7-00045z-NH
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
Cc: kgdb-bugreport@lists.sourceforge.net, stephen.s.brennan@oracle.com,
 amalrajt@meta.com, danielt@kernel.org, linux-serial@vger.kernel.org,
 jason.wessel@windriver.com, osandov@osandov.com,
 linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIERlYyAxMSwgMjAyNCBhdCA3OjQw4oCvQU0gQW1hbCBSYWogVCA8dGphcmxh
bWFAZ21haWwuY29tPiB3cm90ZToKPgo+IEZyb206IEFtYWwgUmFqIFQgPGFtYWxyYWp0QG1ldGEu
Y29tPgo+Cj4gQWRkIGEgbmV3IGZ1bmN0aW9uIGtnZGJfbWVtMmViaW4gdGhhdCBjb252ZXJ0cyBt
ZW1vcnkKPiB0byBiaW5hcnkgZm9ybWF0LCBlc2NhcGluZyBzcGVjaWFsIGNoYXJhY3RlcnMKPiAo
JyQnLCAnIycsIGFuZCAnfScpLiBrZ2RiX21lbTJlYmluIGZ1bmN0aW9uIGVuc3VyZXMKPiB0aGF0
IG1lbW9yeSBkYXRhIGlzIHByb3Blcmx5IGZvcm1hdHRlZCBhbmQgZXNjYXBlZAo+IGJlZm9yZSBi
ZWluZyBzZW50IG92ZXIgdGhlIHdpcmUuIEFkZGl0aW9uYWxseSwgdGhpcwo+IGZ1bmN0aW9uIHJl
ZHVjZXMgdGhlIGFtb3VudCBvZiBkYXRhIGV4Y2hhbmdlZCBiZXR3ZWVuCj4gZGVidWdnZXIgY29t
cGFyZWQgdG8gaGV4Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW1hbCBSYWogVCA8YW1hbHJhanRAbWV0
YS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvbGludXgva2dkYi5oICAgfCAgMSArCj4gIGtlcm5lbC9k
ZWJ1Zy9nZGJzdHViLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgva2dkYi5oIGIvaW5jbHVkZS9saW51eC9rZ2RiLmgKPiBpbmRleCA3NmU4OTFlZTllMzcu
LmZhM2NmMzhhMTRkZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2tnZGIuaAo+ICsrKyBi
L2luY2x1ZGUvbGludXgva2dkYi5oCj4gQEAgLTMyMiw2ICszMjIsNyBAQCBleHRlcm4gc3RydWN0
IGtnZGJfaW8gKmRiZ19pb19vcHM7Cj4KPiAgZXh0ZXJuIGludCBrZ2RiX2hleDJsb25nKGNoYXIg
KipwdHIsIHVuc2lnbmVkIGxvbmcgKmxvbmdfdmFsKTsKPiAgZXh0ZXJuIGNoYXIgKmtnZGJfbWVt
MmhleChjaGFyICptZW0sIGNoYXIgKmJ1ZiwgaW50IGNvdW50KTsKPiArZXh0ZXJuIGNoYXIgKmtn
ZGJfbWVtMmViaW4oY2hhciAqbWVtLCBjaGFyICpidWYsIGludCBjb3VudCk7Cj4gIGV4dGVybiBp
bnQga2dkYl9oZXgybWVtKGNoYXIgKmJ1ZiwgY2hhciAqbWVtLCBpbnQgY291bnQpOwo+Cj4gIGV4
dGVybiBpbnQga2dkYl9pc3JlbW92ZWRicmVhayh1bnNpZ25lZCBsb25nIGFkZHIpOwo+IGRpZmYg
LS1naXQgYS9rZXJuZWwvZGVidWcvZ2Ric3R1Yi5jIGIva2VybmVsL2RlYnVnL2dkYnN0dWIuYwo+
IGluZGV4IGY2MjUxNzJkNGI2Ny4uNjE5OGQyZWI0OWM0IDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9k
ZWJ1Zy9nZGJzdHViLmMKPiArKysgYi9rZXJuZWwvZGVidWcvZ2Ric3R1Yi5jCj4gQEAgLTI1Nyw2
ICsyNTcsMzcgQEAgY2hhciAqa2dkYl9tZW0yaGV4KGNoYXIgKm1lbSwgY2hhciAqYnVmLCBpbnQg
Y291bnQpCj4gICAgICAgICByZXR1cm4gYnVmOwo+ICB9Cj4KPiArLyoKPiArICogQ29udmVydCBt
ZW1vcnkgdG8gYmluYXJ5IGZvcm1hdCBmb3IgR0RCIHJlbW90ZSBwcm90b2NvbAo+ICsgKiB0cmFu
c21pc3Npb24sIGVzY2FwaW5nIHNwZWNpYWwgY2hhcmFjdGVycyAoJCwgIywgYW5kIH0pLgoKV2h5
IGV4YWN0bHkgYXJlIHRob3NlIGNoYXJhY3RlcnMgc3BlY2lhbD8gV2hhdCBjb25zaWRlcnMgdGhl
bSBzcGVjaWFsCmFuZCBzbyB3aHkgZG8geW91IG5lZWQgdG8gZXNjYXBlIHRoZW0/IEkgZ3Vlc3Mg
eW91IHJlYWxseSBqdXN0IGNhcmUKYWJvdXQgYXZvaWRpbmcgIyBhbmQgJCBhbmQgeW91J3JlIHVz
aW5nICd9JyBhcyB5b3VyIGVzY2FwZSBjaGFyYWN0ZXIKc28geW91IG5lZWQgdG8gZXNjYXBlIHRo
YXQgdG9vPwoKWW91ciBmdW5jdGlvbiBjb21tZW50IHNob3VsZCBkZXNjcmliZSB0aGUgZXNjYXBp
bmcgbWV0aG9kIGFuZCBpZGVhbGx5CnByb3ZpZGUgYSBmZXcgZXhhbXBsZXMuCgoKPiArICovCj4g
K2NoYXIgKmtnZGJfbWVtMmViaW4oY2hhciAqbWVtLCBjaGFyICpidWYsIGludCBjb3VudCkKCk9u
ZSBvZiB0aGUgdHdvIGJ1ZmZlcnMgc2VlbXMgbGlrZSBpdCBzaG91bGQgYmUgImNvbnN0Iiwgcmln
aHQ/IFRoYXQKd291bGQgaGVscCBkb2N1bWVudCB3aGljaCB3YXMgaW5wdXQgYW5kIHdoaWNoIHdh
cyBvdXRwdXQuIEkgZ3Vlc3MKIm1lbSIgaXMgdGhlIGlucHV0PwoKImNvdW50IiBzaG91bGQgYmUg
InNpemVfdCIKClByZXN1bWFibHkgdGhlcmUgc2hvdWxkIGJlIHR3byBjb3VudHMgdGFsa2luZyBh
Ym91dCB0aGUgc2l6ZXMgb2YgZWFjaApidWZmZXIsIG9yIGF0IGxlYXN0IHNvbWUgZG9jdW1lbnRh
dGlvbiBzaG91bGQgYmUgaW4gdGhlIGZ1bmN0aW9uCmNvbW1lbnQgdGFsa2luZyBhYm91dCB0aGUg
ZmFjdCB0aGF0ICJidWYiIG5lZWRzIHRvIGJlIHR3aWNlIHRoZSBzaXplPwoKCj4gK3sKPiArICAg
ICAgIGNoYXIgKnRtcDsKPiArICAgICAgIGludCBlcnI7Cj4gKwo+ICsgICAgICAgdG1wID0gYnVm
ICsgY291bnQ7CgpDb3VsZCB1c2UgYSBjb21tZW50IHRoYXQgdGhlIGJ1ZmZlciBuZWVkcyB0byBi
ZSAyeCBsb25nIHRvIGhhbmRsZQplc2NhcGluZyBhbmQgdGhhdCB5b3UnbGwgdXNlIHRoZSAybmQg
aGFsZiBhcyBhIHRlbXAgYnVmZmVyLgoKCj4gKwo+ICsgICAgICAgZXJyID0gY29weV9mcm9tX2tl
cm5lbF9ub2ZhdWx0KHRtcCwgbWVtLCBjb3VudCk7Cj4gKyAgICAgICBpZiAoZXJyKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gTlVMTDsKPiArICAgICAgIHdoaWxlIChjb3VudCA+IDApIHsKCklm
IHlvdSBjaGFuZ2UgYGNvdW50YCB0byBgc2l6ZV90YCB0aGUgYWJvdmUgdGVzdCB3b24ndCB3b3Jr
IGJlY2F1c2UKaXQnbGwgYmUgdW5zaWduZWQuIFN0aWxsIHByb2JhYmx5IGJldHRlciB0byB1c2Ug
YHNpemVfdGAsIGJ1dCBqdXN0IGEKd2FybmluZyB0aGF0IHlvdSdsbCBoYXZlIHRvIGNoYW5nZSB0
aGUgY29uZGl0aW9uLgoKCj4gKyAgICAgICAgICAgICAgIHVuc2lnbmVkIGNoYXIgYyA9ICp0bXA7
Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoYyA9PSAweDdkIHx8IGMgPT0gMHgyMyB8fCBjID09
IDB4MjQpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAqYnVmKysgPSAweDdkOwoKRG9uJ3Qg
aGFyZGNvZGUuIE11Y2ggYmV0dGVyIHRvIHVzZSAnfScsICcjJywgJyQnCgoKPiArICAgICAgICAg
ICAgICAgICAgICAgICAqYnVmKysgPSBjIF4gMHgyMDsKPiArICAgICAgICAgICAgICAgfSBlbHNl
IHsKPiArICAgICAgICAgICAgICAgICAgICAgICAqYnVmKysgPSBjOwo+ICsgICAgICAgICAgICAg
ICB9Cj4gKyAgICAgICAgICAgICAgIGNvdW50IC09IDE7Cj4gKyAgICAgICAgICAgICAgIHRtcCAr
PSAxOwoKY291bnQtLTsKdG1wKys7Cgo+ICsgICAgICAgfQo+ICsgICAgICAgKmJ1ZiA9IDA7CgpX
aHkgaXMgdGhlIHJlc3VsdGluZyBidWZmZXIgJ1wwJyB0ZXJtaW5hdGVkIHdoZW4gdGhlIHNvdXJj
ZSBidWZmZXIKaXNuJ3Q/IEFkZGluZyB0aGlzIHRlcm1pbmF0aW9uIG1lYW5zIHRoYXQgdGhlIGRl
c3RpbmF0aW9uIGJ1ZmZlciBuZWVkcwp0byBiZSAxIGJ5dGUgYmlnZ2VyLCByaWdodD8KCi4uLm9y
IG1heWJlIHRoZSBzb3VyY2UgYnVmZmVyIGRvZXNuJ3QgYWN0dWFsbHkgaGF2ZSBhbnkgZW1iZWRk
ZWQgJ1wwJwpjaGFyYWN0ZXJzIGFuZCB5b3UncmUgdXNpbmcgdGhpcyBmb3IgdGVybWluYXRpb24g
dG8gdGhlIG90aGVyIHNpZGU/IEl0CndvdWxkIGJlIGdvb2QgdG8gY2xhcmlmeS4KCkluIG90aGVy
IHdvcmRzLCBpZiB0aGUgaW5wdXQgaXMgMiBieXRlcyBiaWc6Cid9fScKClRoZSBvdXRwdXQgYnVm
ZmVyIHdpbGwgYmUgNSBieXRlcyBiaWc6Cid9XX1dXDAnCgo+ICsKPiArICAgICAgIHJldHVybiBi
dWY7CgpXaGF0IGV4YWN0bHkgaXMgdGhpcyByZXR1cm4gdmFsdWU/IEl0IHBvaW50cyByaWdodCBw
YXN0IHRoZSBlbmQgb2YgdGhlIGJ1ZmZlcj8KCllvdSBzZWVtIHRvIGp1c3QgdXNlIGl0IGFzIGFu
IGVycm9yIHZhbHVlIChOVUxMIG1lYW5zIGVycm9yLCBub24tTlVMTAptZWFucyBubyBlcnJvciku
IFdoeSBub3QgcmV0dXJuIGFuIGVycm9yIGNvZGUgdGhlbj8KCi1Eb3VnCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGlu
ZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
