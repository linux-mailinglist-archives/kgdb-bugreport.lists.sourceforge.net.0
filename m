Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 411A8B28211
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 15 Aug 2025 16:39:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puFx16LyjdTlpPeKTLVE9+Rmvk29BGGQRfLgUBroLQQ=; b=JXaD9gDgPEymWwIdU9LsImRPCu
	glcqucp5v1da6qnWjLyXIaMxdYe4YuOcz7P5o/kFe/qhF5gQ0lmIu9NFAuUpQx2KeNl/ty/cNwPGM
	CmWmFivL0fEDnk7znBJKfNAGIsj/nE2dwKZ32nevesjMj0sWQ1cL0xihvVV4rYQYo75w=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1umvaw-0000qy-Lt
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 15 Aug 2025 14:39:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1umvav-0000qs-Ty
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 15 Aug 2025 14:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HUPDlQYeNV8xVNLPQ4s+Wppv5EkSz5BsCNrMzhAzL8c=; b=WSB8SwcDjzjjI7ABqQ3fAQ8E6H
 0ltn/5poF0SFkn8o7OvtLGaPm4Yir4Z2+4MrAmniK73RgUDmIgWsvR5TnilfhFljucASRfXNdT/hS
 zNZBtmI+vDbb0IdHMq9wAZ32/+DkRwKOOQKQoJr9YQ27rWymFbuqllUbWKIRNG3AAzqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HUPDlQYeNV8xVNLPQ4s+Wppv5EkSz5BsCNrMzhAzL8c=; b=R7DoFUCINbu/Nm0P7vPmhmX45n
 hapFab8E8DafMS+sojcGaSNhwe/dkHOc0ASWnvnqZx0v2vZj4frNAmCxWzrTxWODSqiQKy3oPVe9Z
 PGfG3xUxqH3qEA7fiPXC1Bl2t0Dmayjr2bK8rssqW2Gw2HGsTw9/dR6/VMR6AlzYWaoU=;
Received: from mail-oa1-f47.google.com ([209.85.160.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1umvav-0003Ce-H2 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 15 Aug 2025 14:39:49 +0000
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-30cce58bb89so1852993fac.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 15 Aug 2025 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755268778; x=1755873578;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HUPDlQYeNV8xVNLPQ4s+Wppv5EkSz5BsCNrMzhAzL8c=;
 b=FugKBZyVVcngwwRvHDNX0jvYJux9cvM37xH2LEjr/Gp6tPKLMqqIEOkzzPeRC1lEiO
 cIEG8FsUse+OCHvm5U1siUL+zx1OfeeRv6iSSrzy/tuzENt2EMW9df4eHRaFYOnaYw1h
 QBCOWQrot6tNVj5gwbbyHMfGZGw8uUkGpZbH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755268778; x=1755873578;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HUPDlQYeNV8xVNLPQ4s+Wppv5EkSz5BsCNrMzhAzL8c=;
 b=f7oiXyQ6XHEf0OtX6pnIu6XOh7a4UVjmLO9sBPSXuS21/96d42FfPobolyHVBGKuAx
 9z2Fykk9hYWlNxzukNVU6shNsMNvcf4JrBkhZvWFDi/g9xp1RKu8WCbWIwApuymr+ei3
 6NQ9oequYdpxNEX/IFMcIkFXgtgqkxVkdAkZ9FQn+nfW5oOBE6d5BI09x/7dsryu71a1
 266KyJuI/Ph6KpupyGBNzyN4IWrI4Dkt5vX2sf25B1e51bdPZj2rtfRg1+pf3ukxujIV
 Wb/eQr9RjAvV9w+wzqjBOONbYpqw3e5ZNE6TfleVlN7JfLbvY0q2tJ29/75YxF3hMl2/
 N0Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnY7Xwf81E+DHG6Y56GWUW24g4L9QncyRae2RSc2G6/kauMm846Bpdt4jhNtFsfmcTEqCbfF34/u7M2fRSDw==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzNW4O5fXZ3iluOGcoHSJH5HcPS47nJM35sN/NY+MO8XfjrrGdL
 yzddOAy0NNP6afPWLxVyQ2GfkH0ntXxCjf2I02ub1RoaZyvg9nKkKnXeLunl5ZIj3citpYsnJG4
 g9XU=
X-Gm-Gg: ASbGncsvfJiVkQJo7KmZMHvT2P0NHuXS0HyAkD2dEzG7eiMBVdN+qST0twVRw84pv7u
 Knu/cUg5xq23BZ1/grdwHSrYcgxk4Oc3gzNrcdXs41inKaaLkFNvZtqMxeCJYfDTCQtf/3mh1cF
 pSpUnk7t/paolH7R+3L7Jv6hgn8FY8jHpOuG4zK5ZqncWkItHTLvY7s38q3DSjedDWMJXIVav4p
 sdbG05Gb4aje0jRu8lDYSdRS4kNO4l1a9bIicqi7ikQSaJ2QAtHLcextdDoHlokISV+gqQCuoU1
 ECZpzaPJaiBGSV+smvkOQWH70VLDkRtXQx9NhsbCtLHTmA3BPiQGId2fWC42UL+y3LMXGolePv5
 3hGodCJkY9HGAEzzcOb8W5ur+u4Bq/Y2P1kFZ6Y7RNsQPV3NXpaajnoLa6gaBFdXKiQ==
X-Google-Smtp-Source: AGHT+IGEcUe/pwkcT9I+oveWwtxUv1t6986Rr0/YSLIClJ1iDFYkOIMQS/7B4PbKyfwVPMhVvm+aLg==
X-Received: by 2002:a17:902:f54d:b0:242:9aaa:1351 with SMTP id
 d9443c01a7336-2446d724f05mr32267155ad.13.1755268375161; 
 Fri, 15 Aug 2025 07:32:55 -0700 (PDT)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com.
 [209.85.214.173]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d516f06sm15432035ad.98.2025.08.15.07.32.54
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 07:32:54 -0700 (PDT)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-24458194d83so14073855ad.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 15 Aug 2025 07:32:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWr1ejqbBD+Vhw83IvOlqeuOhv1djax3/NgxgaW7Q8sQbZlrGHo9LV3Rn0oJVsg/OPf/l11nLY3GMRoiZSiNw==@lists.sourceforge.net
X-Received: by 2002:a17:903:19c7:b0:240:92cc:8fcf with SMTP id
 d9443c01a7336-2446d97a21dmr41288195ad.49.1755268373349; Fri, 15 Aug 2025
 07:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250814220130.281187-2-thorsten.blum@linux.dev>
 <CAD=FV=Udf3pZjhpPxEuHsFynP7GoHnZ7RG=NYZ2gLzm=E_4V4A@mail.gmail.com>
 <0BB3AC5A-5B9B-4149-90CA-80171B8B0A48@linux.dev>
In-Reply-To: <0BB3AC5A-5B9B-4149-90CA-80171B8B0A48@linux.dev>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 15 Aug 2025 07:32:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V06iHUurHQYN07ri=2-5tHon3G2OMnT1rtZ2Qp7EAW+w@mail.gmail.com>
X-Gm-Features: Ac12FXxL2rPDKIvnBjqZEgiiOTotbJwxpdaBhPYpGXK_jpG3oTuZHDGRA0uWCfE
Message-ID: <CAD=FV=V06iHUurHQYN07ri=2-5tHon3G2OMnT1rtZ2Qp7EAW+w@mail.gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Fri, Aug 15,
 2025 at 3:48 AM Thorsten Blum <thorsten.blum@linux.dev>
 wrote: > > Hi Doug, > > On 15. Aug 2025, at 04:05, Doug Anderson wrote: >
 > Let's think about some test cases... > > > > Old cod [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.47 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umvav-0003Ce-H2
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: Replace deprecated strcpy()
 with strscpy() and memcpy()
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
Cc: Nir Lichtman <nir@lichtman.org>, Jason Wessel <jason.wessel@windriver.com>,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>,
 Daniel Thompson <danielt@kernel.org>, linux-hardening@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBGcmksIEF1ZyAxNSwgMjAyNSBhdCAzOjQ44oCvQU0gVGhvcnN0ZW4gQmx1bSA8dGhv
cnN0ZW4uYmx1bUBsaW51eC5kZXY+IHdyb3RlOgo+Cj4gSGkgRG91ZywKPgo+IE9uIDE1LiBBdWcg
MjAyNSwgYXQgMDQ6MDUsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gPiBMZXQncyB0aGluayBhYm91
dCBzb21lIHRlc3QgY2FzZXMuLi4KPiA+Cj4gPiBPbGQgY29kZToKPiA+IG1wLT51c2FnZSA9IGtk
Yl9zdHJkdXAoYXJndlsyXSwgR0ZQX0tEQik7Cj4gPiBpZiAobXAtPnVzYWdlWzBdID09ICciJykg
ewo+ID4gIHN0cmNweShtcC0+dXNhZ2UsIGFyZ3ZbMl0rMSk7Cj4gPiAgbXAtPnVzYWdlW3N0cmxl
bihtcC0+dXNhZ2UpLTFdID0gJ1wwJzsKPiA+IH0KPiA+Cj4gPiBOZXcgY29kZToKPiA+IG1wLT51
c2FnZSA9IGtkYl9zdHJkdXAoYXJndlsyXSwgR0ZQX0tEQik7Cj4gPiBpZiAobXAtPnVzYWdlWzBd
ID09ICciJykKPiA+ICBzdHJzY3B5KG1wLT51c2FnZSwgYXJndlsyXSArIDEsIHN0cmxlbihhcmd2
WzJdKSAtIDEpOwo+ID4KPiA+IEV4YW1wbGUgc3RyaW5nOiBhcmd2WzJdID0gIlwieHl6XCIiCj4g
Pgo+ID4gT2xkOgo+ID4gIG1wLT51c2FnZSA9IHN0cmR1cCgiXCJ4eXpcIiIpCj4gPiAgbXAtPnVz
YWdlIGJlY29tZXMgInh5elwiIgo+ID4gIG1wLT51c2FnZSBiZWNvbWVzICJ4eXoiCj4gPgo+ID4g
TmV3Ogo+ID4gIG1wLT51c2FnZSA9IHN0cmR1cCgiXCJ4eXpcIiIpCj4gPiAgbXAtPnVzYWdlIGJl
Y29tZXMgInh5elwiIgo+ID4gIG1wLT51c2FnZSBkb2Vzbid0IGNoYW5nZSAoISkKPiA+Cj4gPiBU
byBtYXRjaCBvbGQgYmVoYXZpb3IsIEkgdGhpbmsgeW91J2QgbmVlZCAic3RybGVuKGFyZ3ZbMl0p
IC0gMiIsIHJpZ2h0Pwo+Cj4gTm8sIGl0IHNob3VsZCBiZSAic3RybGVuKGFyZ3ZbMl0pIC0gMSIg
dG8gbWF0Y2ggdGhlIG9sZCBiZWhhdmlvci4KPgo+IEluIHRoZSBuZXcgY29kZSwgdGhlcmUgYXJl
IG9ubHkgdHdvIHN0ZXBzIGluc3RlYWQgb2YgdGhyZWUuCj4KPiBXaXRoIHlvdXIgZXhhbXBsZSBz
b3VyY2Ugc3RyaW5nICJcInh5elwiIiBpbiBhcmd2WzJdOgo+Cj4gICAgICAgICBzdHJzY3B5KG1w
LT51c2FnZSwgYXJndlsyXSArIDEsIHN0cmxlbihhcmd2WzJdKSAtIDEpCj4KPiBldmFsdWF0ZXMg
dG86Cj4KPiAgICAgICAgIHN0cnNjcHkobXAtPnVzYWdlLCAieHl6XCIiLCBzdHJsZW4oIlwieHl6
XCIiKSAtIDEpCj4KPiBzdHJsZW4oIlwieHl6XCIiKSBpcyA1LCBzbyB0aGlzIGJlY29tZXM6Cj4K
PiAgICAgICAgIHN0cnNjcHkobXAtPnVzYWdlLCAieHl6XCIiLCA0KQo+Cj4gVW5saWtlIHN0cmNw
eSgpLCBzdHJzY3B5KCkgY29waWVzIGF0IG1vc3QgJ3NpemUgLSAxJyBjaGFyYWN0ZXJzIGFuZCB0
aGVuCj4gYXBwZW5kcyBhIE5VTCB0ZXJtaW5hdG9yLiBJbiB0aGUgZXhhbXBsZSwgaXQgY29waWVz
IG9ubHkgdGhlIGZpcnN0IHRocmVlCj4gYnl0ZXMgKHh5eikgYW5kIHRoZW4gYXBwZW5kcyBhIE5V
TCB0ZXJtaW5hdG9yLCBlZmZlY3RpdmVseSByZXBsYWNpbmcgdGhlCj4gdHJhaWxpbmcgcXVvdGUu
IFRoZSByZXN1bHQgaXMgInh5eiIsIHRoZSBzYW1lIGFzIGJlZm9yZS4KClVnaCwgSSBtaXNzZWQg
dGhhdCBzdHJzY3B5KCkgaW1wbGljaXRseSB0YWtlcyBhd2F5IGFuIGV4dHJhIGNoYXJhY3Rlci4K
U28sIHllcywgeW91ciB2ZXJzaW9uIGRvZXMgYXBwZWFyIGNvcnJlY3QgaW4gdGhhdCBzZW5zZS4g
SXQncwpkZWZpbml0ZWx5IG5vbi1vYnZpb3VzIGFuZCBJIGFncmVlIHdpdGggRGFuaWVsIHRoYXQg
aXQgZG9lc24ndCBmZWVsCmxpa2UgdGhlIHJpZ2h0IHdheSB0byB1c2Ugc3Ryc2NweSgpLgoKLURv
dWcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2Ri
LWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVn
cmVwb3J0Cg==
