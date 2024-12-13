Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D45A19F0157
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 13 Dec 2024 01:57:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tLtzU-0008UQ-Ki
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 13 Dec 2024 00:57:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1tLtzS-0008UG-M7
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Dec 2024 00:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jzmJ+pCUmwGTQBjg+zFWh/ARKLDiOAynXsdh81IlS5k=; b=X5/tcmRQsPOp0pIj41RRPrfS1F
 CnpnqTMsDJM12jFTDkilNezuyJQTi8akTEdJiLeaxeQFGYYoXEMFPrFzyCiWyFC8N09ZkGwnXM515
 5MemAfBF+gClY0os7yOCTocDy5AAq6i9g0BxDRW6OFnVfP/0veDJkXxQnCGeGG2r8PwA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jzmJ+pCUmwGTQBjg+zFWh/ARKLDiOAynXsdh81IlS5k=; b=nRKZBUZyzT2rzA0/2C3FBOn4rB
 QwGYhAE6bOK7ZXX1KAI2k398PvBVL2+Jk0PZ08rQ6JcNglzfDw37FHzEXSsZwBIh2mJiDC+DZMhAk
 smx9DF++wJbja0/FdmPlUEVLnnaYdARgfzMY+n6zA5GPkdBaK6uzAJypo+ixzPQCCArg=;
Received: from mail-lf1-f46.google.com ([209.85.167.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tLtzR-00049x-V3 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Dec 2024 00:57:10 +0000
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso1361730e87.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 12 Dec 2024 16:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734051416; x=1734656216;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jzmJ+pCUmwGTQBjg+zFWh/ARKLDiOAynXsdh81IlS5k=;
 b=fU8VFuALAUnMSarqugbTwpW0ImRTG8jq/687qHXSyVeHCA+EUhGxjPeHqEAj6il0SG
 Ec0HuGU+OgtekZ5mRfVMEIJaP/y+BF4VW+sVuGg7Sm6RxM60WuRITDB1huLkjWRhJ91p
 pEBNZ3hpqRtB4QVC3Ioa18AApzWCNMn3hpZEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734051416; x=1734656216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jzmJ+pCUmwGTQBjg+zFWh/ARKLDiOAynXsdh81IlS5k=;
 b=iqtcM4wCby7WGvb9p3sbcgkSjdn9YZrujjkE2U+5pJgvuN+XzFqgHUtoMB3Wm6KuBX
 b1rUlB2U2U+rEPNTyqWeZdgxodKDrJtCL6/wT+Woj/GS502uHJx6brdnBSqhhLGtx5ho
 Uf9Uh19N5v4s19KpdNGWLA2U/taIXJGrofS606jUs/kLBjK1v7LBJGLE0ED8HM8aILA7
 ek3Ctu7+AQRr1zHPCrtnzAEWkSeFSG6g3AMN/LGYVkooY5OfKg8JJVglgC91+qMDzYEt
 n/cL4GXeSepti51aD+AAkHOzVxPUp1qXkczwYN/tkcx487ga/rSBbFngbHIwpk0Kianm
 r5iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnNFyKo9BdVDgAaxV4IZVgQIJGr5ps8Z5kV26I9XXfV0PEs9LQavKiTWxma86kF6tMn0LaNkRBLVjssd/yww==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx40EhvgJDjQTvdWvq6pqKYj2Wu+kamST7xCvlMWcIjGMCrYtp2
 A0TmkIK75Bki642vSK9zZO30NMHMBf+o5KFJOk/a8aYDe0jtYo+sUrZSlNJHSK2ZPGIKZ3S2T1v
 vCQ==
X-Gm-Gg: ASbGnctKxwzWdA5q5tHMwcgjNOc9/l3MGtt6gwUj/jaflUWG5tDxWAvRFBxkORjXLkY
 IBzUWuqQAlZUOM3+k9jTvilpWvCHiIcYnpayIm09c/A9vu0JRBz9hXiSo/lLME/Nb1gW4skLyV2
 d3OjTJ+Z8MeiIq3JnXw3LEk+aOL4PRfsJe8hDqcdGxN5chriMkBsn8P6PnZzbQTeP6q//SGEXxZ
 +yK2LjF2OUjlfE04gYJi2ENLIb1eCr6CK473lHz6X3zGRXkz6hIErcl/1hY7URt9UHTdG9inQOH
 Kalc5EkMQSiZIlDvTODun9rI
X-Google-Smtp-Source: AGHT+IF9xNQwimqFQq+9M/ZFAjg6j5XYiSQfvL/MB1ScJk2UYqGfPxHOFvMuLyGV229Bna0JAX/Emw==
X-Received: by 2002:a05:6512:3b8d:b0:53e:395c:6887 with SMTP id
 2adb3069b0e04-5408ad7f875mr105114e87.2.1734051416135; 
 Thu, 12 Dec 2024 16:56:56 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5402bfd8d20sm630835e87.26.2024.12.12.16.56.54
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 16:56:55 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ffdbc0c103so11124211fa.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 12 Dec 2024 16:56:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVHwWCG6KJpXDo/D5kEnax7AIbGvdgho0XBV5iFA9yGFgbbrRK15JcfD+69yeTyq70I7Bm1ayNjYfj38vNEjw==@lists.sourceforge.net
X-Received: by 2002:a2e:ab07:0:b0:302:3508:f4ab with SMTP id
 38308e7fff4ca-3025447d9dcmr2268471fa.21.1734051414355; Thu, 12 Dec 2024
 16:56:54 -0800 (PST)
MIME-Version: 1.0
References: <20241211153955.33518-1-tjarlama@gmail.com>
 <20241211153955.33518-4-tjarlama@gmail.com>
In-Reply-To: <20241211153955.33518-4-tjarlama@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Dec 2024 16:56:43 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WMb5cftA7vBWm14HA9cjMMJECZbHWvVnvkSDwKBmYiBg@mail.gmail.com>
X-Gm-Features: AbW1kvbe0dw5XDbEnMkEkuS05NwlhGfOZ6MrQyJM9RhDk2_fuFMXInuRbV1-Das
Message-ID: <CAD=FV=WMb5cftA7vBWm14HA9cjMMJECZbHWvVnvkSDwKBmYiBg@mail.gmail.com>
To: Amal Raj T <tjarlama@gmail.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Dec 11, 2024 at 7:40 AM Amal Raj T <tjarlama@gmail.com>
    wrote: > > From: Amal Raj T <amalrajt@meta.com> > > Add a new query `linux.vmcoreinfo`
    to kgdb that returns > vmcoreinfo to the client [...] 
 
 Content analysis details:   (-0.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.167.46 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.167.46 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.46 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tLtzR-00049x-V3
Subject: Re: [Kgdb-bugreport] [PATCH v2 3/3] kgdb: Add command
 linux.vmcoreinfo to kgdb
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
Y29tPgo+Cj4gQWRkIGEgbmV3IHF1ZXJ5IGBsaW51eC52bWNvcmVpbmZvYCB0byBrZ2RiIHRoYXQg
cmV0dXJucwo+IHZtY29yZWluZm8gdG8gdGhlIGNsaWVudCB1c2luZyB0aGUgbWVtMmViaW4gZW5j
b2RpbmcuCgpDYW4geW91IGFkZCBtb3JlIGRvY3VtZW50YXRpb24gYWJvdXQgYGxpbnV4LnZtY29y
ZWluZm9gPyBJcyB0aGVyZSBhCkdEQiBwYXRjaCB0aGF0IGdvZXMgYWxvbmcgd2l0aCB0aGlzIHRo
YXQgZG9lcyBzb21ldGhpbmcgd2l0aCBpdD8gSQphc3N1bWUgdGhhdCBHREIgcGF0Y2ggd291bGQg
bmVlZCB0aGUgc2FtZSBtYWdpYyBlc2NhcGluZyBzZXF1ZW5jZQp5b3UndmUgY29tZSB1cCB3aXRo
PwoKSG93IGRvZXMgb25lIGVuZCB1cCBoYXZpbmcgYSBWTSBjb3JlIGZvciBrZ2RiIHRvIHNlcnZl
IHVwPyBEb2VzIGl0CmF1dG9tYXRpY2FsbHkgZ2V0IGdlbmVyYXRlZCBiZWZvcmUgd2UgZW50ZXIg
a2RiIGR1ZSB0byBhIGNyYXNoIG5vdwp0aGF0IHdlIHNlbGVjdCBWTUNPUkVfSU5GTywgb3IgaXMg
dGhlcmUgc29tZSBvdGhlciBtZWNoYW5pc20/CgoKPiBNYXhpbXVtIHNpemUgb2Ygb3V0cHV0IGJ1
ZmZlciBpcyBzZXQgdG8gM1ggdGhlIG1heGltdW0KPiBzaXplIG9mIFZNQ09SRUlORk9fQllURVMg
KGtnZGJfbWVtMmViaW4oKSByZXF1aXJlcyAxeAo+IGZvciB0aGUgdGVtcG9yYXJ5IGNvcHkgcGx1
cyB1cCB0byAyeCBmb3IgdGhlIGVzY2FwZWQKPiBkYXRhKS4KCkNhbiB5b3UgZXhwbGFpbiB0aGUg
M3ggbW9yZT8gU3BlY2lmaWNhbGx5LCBpdCBsb29rcyBsaWtlIHRoZSB0ZW1wb3JhcnkKY29weSBk
b2Vzbid0IHRha2UgdXAgYW55IGV4dHJhIHNwYWNlLCB1bmxlc3MgSSByZWFkIHlvdXIgY29kZSB3
cm9uZwooYWx3YXlzIHBvc3NpYmxlKS4KCkxldCdzIGFzc3VtZSBtZW0gaXMgJ319JyBhbmQgY291
bnQgaXMgMi4KCldoZW4gdGhlIGZ1bmN0aW9uIHN0YXJ0cyB5b3UgZW5kIHVwIGNvcHlpbmcgbWVt
IHRvIHRoZSBlbmQgb2YgdGhlCmJ1ZmZlci4gVGh1cywgYnVmZmVyIHdpbGwgYmUgJz8/fX0nCgpU
aGUgZmlyc3QgdGltZSB0aHJvdWdoIHRoZSBsb29wLCB5b3UnbGwgZW5kIGZpbGxpbmcgaW4gdGhl
IGVzY2FwZWQKZmlyc3QgY2hhcmFjdGVyIGFuZCB0aGUgYnVmZmVyIHdpbGwgYmUgJ31dfX0nCgpU
aGUgc2Vjb25kIHRpbWUgdGhyb3VnaCB0aGUgbG9vcCB5b3UnbGwgaGF2ZSAnfV19XScuCgouLi5z
byBJIHRoaW5rIHlvdSBuZWVkIDJ4IHRoZSBlc2NhcGVkIGRhdGEgKG9yIDJ4ICsxIHVubGVzcyB5
b3UgcmVtb3ZlCnRoZSAnXDAnIHRlcm1pbmF0aW9uIGZyb20geW91ciBlYXJsaWVyIHBhdGNoKS4K
Ck9oLCBJIGd1ZXNzIHlvdSBhY3R1YWxseSBhbHNvIG5lZWQgMSBleHRyYSBieXRlIGZvciB0aGUg
J1EnIGluIHlvdXIgcmVzcG9uc2U/CgoKPiBTaWduZWQtb2ZmLWJ5OiBBbWFsIFJhaiBUIDxhbWFs
cmFqdEBtZXRhLmNvbT4KPiAtLS0KPiAga2VybmVsL2RlYnVnL2dkYnN0dWIuYyB8IDEwICsrKysr
KysrKy0KPiAgbGliL0tjb25maWcua2dkYiAgICAgICB8ICAxICsKPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEva2VybmVs
L2RlYnVnL2dkYnN0dWIuYyBiL2tlcm5lbC9kZWJ1Zy9nZGJzdHViLmMKPiBpbmRleCA2MTk4ZDJl
YjQ5YzQuLjViZWM0NDRmYzZkMyAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvZGVidWcvZ2Ric3R1Yi5j
Cj4gKysrIGIva2VybmVsL2RlYnVnL2dkYnN0dWIuYwo+IEBAIC0zNCwxMyArMzQsMTQgQEAKPiAg
I2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KPiAgI2luY2x1ZGUgPGFzbS9jYWNoZWZsdXNoLmg+
Cj4gICNpbmNsdWRlIDxsaW51eC91bmFsaWduZWQuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3ZtY29y
ZV9pbmZvLmg+Cj4gICNpbmNsdWRlICJkZWJ1Z19jb3JlLmgiCj4KPiAgI2RlZmluZSBLR0RCX01B
WF9USFJFQURfUVVFUlkgMTcKPgo+ICAvKiBPdXIgSS9PIGJ1ZmZlcnMuICovCj4gIHN0YXRpYyBj
aGFyICAgICAgICAgICAgICAgICAgICByZW1jb21faW5fYnVmZmVyW0JVRk1BWF07Cj4gLXN0YXRp
YyBjaGFyICAgICAgICAgICAgICAgICAgICByZW1jb21fb3V0X2J1ZmZlcltCVUZNQVhdOwo+ICtz
dGF0aWMgY2hhciAgICAgICAgICAgICAgICAgICAgcmVtY29tX291dF9idWZmZXJbTUFYKFZNQ09S
RUlORk9fQllURVMqMywgQlVGTUFYKV07Cj4gIHN0YXRpYyBpbnQgICAgICAgICAgICAgICAgICAg
ICBnZGJzdHViX3VzZV9wcmV2X2luX2J1ZjsKPiAgc3RhdGljIGludCAgICAgICAgICAgICAgICAg
ICAgIGdkYnN0dWJfcHJldl9pbl9idWZfcG9zOwo+Cj4gQEAgLTc2OCw2ICs3NjksMTMgQEAgc3Rh
dGljIHZvaWQgZ2RiX2NtZF9xdWVyeShzdHJ1Y3Qga2dkYl9zdGF0ZSAqa3MpCj4gICAgICAgICAg
ICAgICAgICooLS1wdHIpID0gJ1wwJzsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4KPiArICAg
ICAgIGNhc2UgJ2wnOgo+ICsgICAgICAgICAgICAgICBpZiAobWVtY21wKHJlbWNvbV9pbl9idWZm
ZXIgKyAxLCAibGludXgudm1jb3JlaW5mbyIsIDE2KSA9PSAwKSB7CgpJcyB0aGVyZSB0ZXJtaW5h
dGlvbiBpbiB0aGUgYHJlbWNvbV9pbl9idWZmZXJgPyBJZiBzbywgSSdkIHJhdGhlciBzZWUKYSBz
dHJpbmcgY29tcGFyaXNvbiBmdW5jdGlvbiB1c2VkLiBPdGhlcndpc2UKYGxpbnV4LnZtY29yZWlu
Zm9XaXRoRXh0cmFTdHVmZkF0VGhlRW5kYCB3aWxsIGFsc28gbWF0Y2guCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGlu
ZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
