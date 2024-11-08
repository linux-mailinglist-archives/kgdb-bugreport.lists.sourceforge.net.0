Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8999C2363
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 Nov 2024 18:38:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t9Sw2-0004qE-F2
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 08 Nov 2024 17:38:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1t9Sw0-0004q5-TS
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 08 Nov 2024 17:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tPmkC98W7OTKqBtV49IwWiImDhxD8gmPOBXk3WDMLJ0=; b=kE7cMhs2U9/QMIZ2jArWDQlmEm
 5HFCxFIkhxlpZxVlLQLOfxbxNYPpMJ+W45IQ5HomWnOHUBKIvfXyP3yunkFhGCFPyWE9UMV89EOhb
 TnimDjfnbwaO+a8rPpTDCZMcQ5jz/TlOkiqCFYkJ6xX0e3Ez6aWRxYOq6zToJdD0KvoE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tPmkC98W7OTKqBtV49IwWiImDhxD8gmPOBXk3WDMLJ0=; b=Y9HN9jaLW74obijJ4L/QF78MFI
 oMf1XMrspuV901e+rwhiP0yd6iNQCsuuRqWuCvfSD3+mhHGG9h2DXNU1TnessptWU1H/wfoRBGn/p
 4RBxmBosXeOJifxLmw82c2UEg8m+IGaUizskZp5+YKvasTxDWhvnjMsaTaeqEiOB4QMc=;
Received: from mail-lf1-f54.google.com ([209.85.167.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t9Svp-0008IW-8H for kgdb-bugreport@lists.sourceforge.net;
 Fri, 08 Nov 2024 17:38:11 +0000
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-539e63c8678so3037203e87.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 08 Nov 2024 09:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1731087468; x=1731692268;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tPmkC98W7OTKqBtV49IwWiImDhxD8gmPOBXk3WDMLJ0=;
 b=B6TJooE8hFNrCCLqSav0BSh2BBAfB1XrTm/ApxeOSn6GTVbe550ie64b6vgxzRZuzW
 QRInUJq2QeVwXxbZDXOfIaRcr9ZDSLu0HjtFSEfJEE/FFWmuXuYJBIch87nvSoaijVic
 EPCFOpHMUTnOP0oHjSYsU0DlzH2W7zGDTKpDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731087468; x=1731692268;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tPmkC98W7OTKqBtV49IwWiImDhxD8gmPOBXk3WDMLJ0=;
 b=h4sCiH4h6+jHLkSlQ4to+XddxVHbhqIjjkK34nr2jfOP5rAhsQdDBbHiJMcSkaoLsg
 M0wxWIVWoEcuFDM65OcoWIjdFUkbUKkbo1UC0+nGVnIog56omaqZh8pQlqa7zmhTUsXu
 Swrpecpjo3LfRGf6aEzmgHMgMS/JKp3XdI2fN4WplTQNZyRjjOdI7b39+nlH0aW31NZ7
 tzLNlJnj5X5wM4BkPluT6vtgNAcNmRG5LRj1zT8CdLgu2RL3SfoEG2N2hYTbBM5KQ9hr
 CDD2aON7Sn+6GgDKnHn/wwO/RWab5rCENDpOsVMK6d83Nqyg1Ks7iAwJD7ZMrzQm01B8
 HCiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwwP5uN0Oz5l/dX28ZaPUGlvHsYgou7FVHvXF6NneJCDs3ojxawe+r0mfwdD8qDvbvsviH8bmce+jXhNb+nA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyP/nSXFUpAFQprOKjE4qJroLcfleYGwB57xNg1JzFU5pp+RTz/
 rIIWFVwrSLB5JBm0rpOA5N0jkbM4lLlKlSvIrq1mPXRbiDooh9TosEo204dDVLjGQaW32o9xP3f
 8jg==
X-Google-Smtp-Source: AGHT+IFqt4DorMCXheTYMRXsmdGNah8Fcc+BB3PixQ39DYmrwwx0quYpegXDnv4og2QawpmkqzbV8g==
X-Received: by 2002:a05:6512:ace:b0:52c:9e82:a971 with SMTP id
 2adb3069b0e04-53d862cd223mr2052959e87.7.1731087468063; 
 Fri, 08 Nov 2024 09:37:48 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d826a9c64sm673505e87.211.2024.11.08.09.37.47
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 09:37:47 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-539fe76e802so2897253e87.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 08 Nov 2024 09:37:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX/W5uB43dHHkJNBbok6W2ANt0wdw7KnWHpgnHui8DzFeOKOpiQ1X7vnB3pltY7uF8gw2x5GNTa9LuFraKVSw==@lists.sourceforge.net
X-Received: by 2002:a05:6512:3a90:b0:53b:1e70:6ad0 with SMTP id
 2adb3069b0e04-53d862e2e89mr2144388e87.27.1731087466531; Fri, 08 Nov 2024
 09:37:46 -0800 (PST)
MIME-Version: 1.0
References: <Zy093jVKPs9gSVx2@telecaster>
 <CAD=FV=UZKZ_RL73+JLjeW2FmAfifSyXqLV3M30XzmJSPE9Trzw@mail.gmail.com>
 <Zy1lyACVnZK4xwuW@telecaster>
 <CAD=FV=U2eiG1TuTq48VL+kNCxN6qp_ZcDk3o_6p3B_ENOspQ9Q@mail.gmail.com>
 <Zy45mCCGZ9sHsXTT@telecaster>
In-Reply-To: <Zy45mCCGZ9sHsXTT@telecaster>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 8 Nov 2024 09:37:32 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WN5Nzjs2KowMbTij8CZ+T_eZxJ5rLdyyBDk-1H_Dj3cg@mail.gmail.com>
Message-ID: <CAD=FV=WN5Nzjs2KowMbTij8CZ+T_eZxJ5rLdyyBDk-1H_Dj3cg@mail.gmail.com>
To: Omar Sandoval <osandov@osandov.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Fri, Nov 8, 2024 at 8:17 AM Omar Sandoval <osandov@osandov.com>
    wrote: > > On Fri, Nov 08, 2024 at 07:31:19AM -0800, Doug Anderson wrote:
    > > Hi, > > > > On Thu, Nov 7, 2024 at 5:13 PM Omar San [...] 
 
 Content analysis details:   (-0.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.54 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t9Svp-0008IW-8H
Subject: Re: [Kgdb-bugreport] kgdb replacing newline with CRLF in custom
 query response
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Stephen Brennan <stephen.s.brennan@oracle.com>, Amal Raj T <amalrajt@meta.com>,
 linux-serial@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBGcmksIE5vdiA4LCAyMDI0IGF0IDg6MTfigK9BTSBPbWFyIFNhbmRvdmFsIDxvc2Fu
ZG92QG9zYW5kb3YuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgTm92IDA4LCAyMDI0IGF0IDA3OjMx
OjE5QU0gLTA4MDAsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBPbiBUaHUs
IE5vdiA3LCAyMDI0IGF0IDU6MTPigK9QTSBPbWFyIFNhbmRvdmFsIDxvc2FuZG92QG9zYW5kb3Yu
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVGh1LCBOb3YgMDcsIDIwMjQgYXQgMDU6MDg6NThQ
TSAtMDgwMCwgRG91ZyBBbmRlcnNvbiB3cm90ZToKPiA+ID4gPiBIaSwKPiA+ID4gPgo+ID4gPiA+
IE9uIFRodSwgTm92IDcsIDIwMjQgYXQgMjoyM+KAr1BNIE9tYXIgU2FuZG92YWwgPG9zYW5kb3ZA
b3NhbmRvdi5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IEhpIGV2ZXJ5b25lLAo+ID4g
PiA+ID4KPiA+ID4gPiA+IEFtYWwgaXMgd29ya2luZyBvbiBhZGRpbmcgYSBjdXN0b20gcXVlcnkg
cGFja2V0IHRvIGtnZGIgZm9yIGdldHRpbmcgdGhlCj4gPiA+ID4gPiBrZXJuZWwncyB2bWNvcmVp
bmZvLiBUaGUgcmF0aW9uYWxlIGFuZCBkZXRhaWxzIGFyZSBhdmFpbGFibGUgaGVyZToKPiA+ID4g
PiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vc2FuZG92L2RyZ24vd2lraS9HREItUmVtb3RlLVByb3Rv
Y29sLXByb3Bvc2FsOi1saW51eC52bWNvcmVpbmZvLXF1ZXJ5LXBhY2tldAo+ID4gPiA+ID4KPiA+
ID4gPiA+IHZtY29yZWluZm8gaXMgYWJvdXQgM2tCLCBzbyB3ZSB3ZXJlIGhvcGluZyB0byBhdm9p
ZCBoZXgtZW5jb2RpbmcgdGhlCj4gPiA+ID4gPiByZXNwb25zZSBhbmQgZG91YmxpbmcgdGhlIHRp
bWUgaXQgdGFrZXMgdG8gdHJhbnNtaXQgb3ZlciBhIHNsb3cgc2VyaWFsCj4gPiA+ID4gPiBjb25u
ZWN0aW9uLiBJbnN0ZWFkLCB3ZSB3ZXJlIGhvcGluZyB0byB1c2UgdGhlIGVzY2FwZWQgYmluYXJ5
IGZvcm1hdCwKPiA+ID4gPiA+IHdoaWNoIGVzY2FwZXMgdGhlIGNoYXJhY3RlcnMgIyR9KiBhbmQg
bGVhdmVzIG90aGVyIGJ5dGVzIHVudG91Y2hlZC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBXZSByYW4g
aW50byBhIHByb2JsZW0sIHRob3VnaDogdm1jb3JlaW5mbyBjb250YWlucyBuZXdsaW5lIGNoYXJh
Y3RlcnMsCj4gPiA+ID4gPiB3aGljaCB0aGUgc2VyaWFsIGNvcmUgcmVwbGFjZXMgd2l0aCBDUkxG
OyBzZWUgY29tbWl0IGM3ZDQ0YTAyYWM2MAo+ID4gPiA+ID4gKCJzZXJpYWxfY29yZTogQ29tbW9u
YWxpemUgY3JsZiB3aGVuIHdvcmtpbmcgdy8gYSBub24gb3BlbiBjb25zb2xlCj4gPiA+ID4gPiBw
b3J0IikuCj4gPiA+ID4KPiA+ID4gPiBGV0lXLCB0aGUgcHJvYmxlbSBwcmVkYXRlcyB0aGF0IGNv
bW1pdCwgYnV0IHRoYXQgY29tbWl0IGF0IGxlYXN0IG1vdmVkCj4gPiA+ID4gaXQgdG8gYmUgc29t
ZXBsYWNlIGNvbW1vbi4gQmVmb3JlIHRoYXQgc29tZSBzZXJpYWwgZHJpdmVycyB3ZXJlCj4gPiA+
ID4gaGFyZGNvZGluZyBpdC4uLiA7LSkKPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIGVm
ZmVjdGl2ZWx5IGNvcnJ1cHRzIHRoZSBkYXRhIGFuZCBjYXVzZXMgYSBjaGVja3N1bQo+ID4gPiA+
ID4gbWlzbWF0Y2guCj4gPiA+ID4gPgo+ID4gPiA+ID4gV2UnZCBsb3ZlIHNvbWUgaW5wdXQgb24g
aG93IHRvIHdvcmsgYXJvdW5kIHRoaXMsIGVzcGVjaWFsbHkgZnJvbSB0aGUKPiA+ID4gPiA+IGtn
ZGIgbWFpbnRhaW5lcnMuIEhlcmUgYXJlIGEgZmV3IG9wdGlvbnMsIGluIGRlc2NlbmRpbmcgb3Jk
ZXIgb2YgbXkKPiA+ID4gPiA+IHByZWZlcmVuY2U6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gMS4gRGlz
YWJsZSB0aGUgTEYgLT4gQ1JMRiByZXBsYWNlbWVudCB3aGlsZSBzZW5kaW5nIGJpbmFyeSBkYXRh
Lgo+ID4gPiA+ID4gMi4gRXNjYXBlIHRoZSBuZXdsaW5lcyB1c2luZyBzb21lIG90aGVyIGN1c3Rv
bSBzY2hlbWUuCj4gPiA+ID4gPiAzLiBHaXZlIHVwIGFuZCBoZXgtZW5jb2RlIHRoZSByZXNwb25z
ZS4KPiA+ID4gPgo+ID4gPiA+IEkgaGF2ZW4ndCB0cmllZCBwcm90b3R5cGluZyBpdCwgYnV0IHdo
YXQgYWJvdXQgbW92aW5nIHRoZSBMUiAtPiBDUkxGCj4gPiA+ID4gY29kZSB0byBrZGJfbXNnX3dy
aXRlKCkuIEl0IHdvdWxkIGJlIHJlYWxseSBlYXN5IHRvIGRvIHRoaXMgaW4gdGhlCj4gPiA+ID4g
Y2FzZSB3aGVyZSB3ZSdyZSBkb2luZyAiZGJnX2lvX29wcy0+d3JpdGVfY2hhcigpIiBzaW5jZSB3
ZSdyZSBhbHJlYWR5Cj4gPiA+ID4gcHJvY2Vzc2luZyBjaGFyYWN0ZXIgYXQgYSB0aW1lLiBJdCB3
b3VsZCBiZSBoYXJkZXIgdG8gZG8gdGhpcyB3aGVuCj4gPiA+ID4gYWxzbyBzZW5kaW5nIHRoZSBv
dXRwdXQgdG8gdGhlIHZhcmlvdXMgY29uc29sZSwgYnV0IG1heSBub3QgX3Rvb18KPiA+ID4gPiBo
YXJkPyBZb3UgY291bGQgbG9vcCBzZWFyY2hpbmcgZm9yICJcbiIgYW5kIHNlbmQgYWxsIHRoZSBj
aGFyYWN0ZXJzCj4gPiA+ID4gYmVmb3JlIHRoZSAiXG4iLCB0aGVuIHNlbmQgYSAiXHIiLCB0aGVu
IHNlbmQgdGhlICJcbiIgYW5kIGFsbCB0aGUKPiA+ID4gPiBjaGFyYWN0ZXJzIHVwIHRvIHRoZSBu
ZXh0ICJcbiIuCgpBY3R1YWxseSwgbG9va2luZyBhdCB0aGlzIGFnYWluLCBJIHdvbmRlciBpZiB3
ZSBldmVuIG5lZWQgdG8gZG8gYW55CnRyYW5zZm9ybWF0aW9uIGJlZm9yZSBzZW5kaW5nIGl0IHRv
IHRoZSB2YXJpb3VzIGNvbnNvbGVzLiBQcm9iYWJseQpub3QuIEkgdGhpbmsgaXQncyBfanVzdF8g
dGhlIHdyaXRlX2NoYXIoKSBwYXRoIHRoYXQgbmVlZGVkIGl0PwoKCj4gPiA+ID4gSWYgeW91IGRp
ZCB0aGlzIHRoZW4geW91J2QgbG9zZSB0aGUgIlxuIiB0byAiXHJcbiIgY29tYmluYXRpb24gaW4g
dGhlCj4gPiA+ID4gZ2RiIHN0dWIsIGJ1dCBfcHJvYmFibHlfIHRoYXQgZG9lc24ndCBtYXR0ZXI/
Cj4gPiA+Cj4gPiA+IFRoYXQgc291bmRzIHJlYXNvbmFibGUuIEkgd2FzIGNvbmNlcm5lZCB3aGV0
aGVyIHRoaXMgd291bGQgYWZmZWN0Cj4gPiA+IGFueXRoaW5nIGVsc2UgdXNpbmcgdGhlIC0+cG9s
bF9wdXRfY2hhcigpIHR0eSBvcGVyYXRpb24sIGJ1dCBrZ2RiIHNlZW1zCj4gPiA+IHRvIGJlIHRo
ZSBvbmx5IHVzZXIsIGRvZXMgdGhhdCBzb3VuZCByaWdodD8KPiA+Cj4gPiBSaWdodC4gQXMgZmFy
IGFzIEkgY2FuIHRlbGwsIGtnZGIgaXMgdGhlIG9ubHkgdXNlciBvZiBwb2xsX3B1dF9jaGFyKCku
Cj4KPiBBaCwgb25lIG90aGVyIGNvbmNlcm4sIHRob3VnaDogb25seSB1YXJ0X3BvbGxfcHV0X2No
YXIoKSBkb2VzIHRoZSBDUkxGCj4gcmVwbGFjZW1lbnQsIGJ1dCB0aGVyZSBhcmUgb3RoZXIgdHR5
X29wZXJhdGlvbnMgdGhhdCBkb24ndCwgbGlrZQo+IGh2Y19wb2xsX3B1dF9jaGFyKCkuIFNvIGlm
IHdlIG1vdmUgdGhhdCB0byBrZGJfbXNnX3dyaXRlKCksIHRoZW4gd2UnbGwKPiBiZSBhZGRpbmcg
ZXh0cmEgJ1xyJyBmb3Igb3RoZXIgdHR5IHR5cGVzLiBXb3VsZCB0aGF0IGJlIGEgcHJvYmxlbT8K
CkkgaG9uZXN0bHkgZG9uJ3Qga25vdy4gSSBndWVzcyBhbHNvIGl0IGNhbiBiZSBub3RlZCB0aGF0
IGlmIHdlIGRvIGl0CmluIGtkYl9tc2dfd3JpdGUoKSB0aGVuIHRoZSB3cml0ZV9jaGFyKCkgcGF0
aCBjYW4gZXZlbiB0YWtlIHVzIHRvCnBsYWNlcyB0aGF0IGRvbid0IGludm9rZSB1YXJ0X3BvbGxf
cHV0X2NoYXIoKS4gRm9yIGluc3RhbmNlCiJlaGNpLWRiZ3AuYyIgcmVnaXN0ZXJzIGl0cyBvd24g
aW9fbW9kdWxlLi4uCgpCbGVoLiBJdCBfcHJvYmFibHlfIHdvdWxkbid0IGJlIGEgYmlnIGRlYWwg
dG8gZG8gdGhlIExGIC0+IENSTEYgZm9yCmFsbCB0aGVzZSwgYnV0IEkgZG9uJ3Qga25vdyBmb3Ig
c3VyZS4gSSBndWVzcyB3b3JzdCBjYXNlIHlvdSBjb3VsZCBhZGQKc29tZSBmbGFnIGluIHRoZSAi
ZGJnX2lvX29wcyIgYW5kIGZpZ3VyZSBvdXQgaG93IHRvIHNldCBpdCBqdXN0IGZvcgpVQVJUcz8K
CgotRG91ZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dk
Yi1idWdyZXBvcnQK
