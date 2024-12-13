Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 793599F0151
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 13 Dec 2024 01:56:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tLtyU-0002FL-9z
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 13 Dec 2024 00:56:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1tLtyR-0002F3-Fq
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Dec 2024 00:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fXGrN9zDEEsnJysMYit4acN2irkFENJw6tU7ppFprrw=; b=CMNtHaVblU/yobKZ8++SqGh5ls
 3Pftz3mFDM0Rjmg1A/RnpQJUqA1zOTs+sUp6foTXqQQ0WiqKa2+NdZc63s++IcxViA8J5dCG2H+3K
 nXLbbHOqQww7ntoFg+pGXgqfPGE29QP6n5DBbrUXCtBqHTAxKWEnkUQjr4wDAu2bxnG4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fXGrN9zDEEsnJysMYit4acN2irkFENJw6tU7ppFprrw=; b=iyMmB0hKAWxW+pY13ldk1LwunI
 HsoT0Mz9TVIGMN7Mw4EOkJy/DZbV1Ms6Zfa9sjYNrBdkjc9hPHSuZxYN75kB03tCS+vwPLLpXv3An
 ve5Q+mBHYkT4vVQlo0eiVdJtTviViDL5FznULqTMU208Y40x3Tp4mH1LXK3e1TK6Fwt8=;
Received: from mail-lf1-f48.google.com ([209.85.167.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tLtyJ-00046W-Bg for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Dec 2024 00:55:59 +0000
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-540254357c8so1135995e87.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 12 Dec 2024 16:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734051351; x=1734656151;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fXGrN9zDEEsnJysMYit4acN2irkFENJw6tU7ppFprrw=;
 b=L9+XimDvH1xTTcLaOJRrjZPvyE+Kl+0idWKFff5GLBRXjXw5zx1JdfPDiTYZCEvjQq
 lcttTvbC6mDVi3qlxwnEbpOEy+/CsFNohOsATJvBx5kNUZblJtuq6Rg0Qslr6PGyQxqW
 GT9XnbHMKd4B0LYuE4XoX5cJTuJKpddu8uO7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734051351; x=1734656151;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fXGrN9zDEEsnJysMYit4acN2irkFENJw6tU7ppFprrw=;
 b=OhLpMI/3xeUR7FrbXFK69+s3Smi6mwEBwIVDRejWCp6AmAgNyJu1jlCm0f59iU9/1b
 yVTJtUUivHXTHajKBhH4pHTBJavXXO2CwYOpFaq7+5VfiWjcnm0qK/bnKkYfkZwt6+YR
 wemWk6SSeCB7RkSC7CNJw69O1HbJyyJ7WHCNbqwlfXe/S+ChLX5Z2V45pSpyeRG7oM2a
 v+ixEFXZ52PXKcwjp7dtv5YwS26rsMeXNfUnTQZkCGyIs+wYzCJ1DD/Xtyd9G9bn7cKs
 oAx0SvgcEY1HGEh3w0Qx0bAbW72jd8/BpmaV1+/2j3+J108YYcq63gF3kiuxRTprdn+4
 JRqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9ZusBh2clsEgXngW8fFBgZqKFUn+r5ujPFNG1OW6A3NtibnIbu2flXEcamQTQuwkatSjRx0FtI6bpmnv2Cw==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwcwdzxWf6Is1zMuOT+WSCxQuwvmeBY+yOVTGeEUuS7SCkXGALV
 FAInqiaQai/kJLwmPNjewjpi/adcL99cZef85/cz/pEPJB5VlZ3FyxnVRqim+PtXX0ZPJ7VchcT
 6hA==
X-Gm-Gg: ASbGnctt1+uv0p37/vkEP+fFhgVfgvMja0nMnT10K/RtkwdZ3CaIz+BMYTJGFL7zEHu
 zIOIychuMFVyNV7XLkMsPo5zvA26gDsg0Ju1myyXbTqpMq0EvxchBqknikExBxFoWQ/C3oVoF9y
 +NIC0bn7Yu5HlhNI0XcyiZAWbC8qqiNRINKdJR0hoxU7H+LvIavHMk+kNFknhdz3hxamWa1rCQz
 E+p50pus1SLR/3g7e6YOP+YytQSMlhn+lveuLuPf7j9fPMK33jE7cLeIE/ZIpkKmUd6LBDFhxZn
 xgwNxaUzA6PC8nkWUnsJ
X-Google-Smtp-Source: AGHT+IFqNRZ3YGXn7BXUT+Mu65ZoEsnSpyhaKqkuTqPpDLex2jNe1OByKzeUTUe9em7H9VARTyoy5A==
X-Received: by 2002:a05:6512:b8a:b0:53e:3aaa:5c7c with SMTP id
 2adb3069b0e04-54099b72a81mr116063e87.51.1734051350939; 
 Thu, 12 Dec 2024 16:55:50 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e38809f9asm2064518e87.28.2024.12.12.16.55.49
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 16:55:50 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-540254357c8so1135959e87.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 12 Dec 2024 16:55:49 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVFdnXXrRO8brCtE9X5uSk8W3wCcsAaPtk/Z3vJ5YnoYLljloyNxWYNKSpCGSfwXpl4vLtD1rBg7dGXrUSLvQ==@lists.sourceforge.net
X-Received: by 2002:a05:6512:3a88:b0:540:1dca:52bd with SMTP id
 2adb3069b0e04-540905680c2mr99501e87.29.1734051349295; Thu, 12 Dec 2024
 16:55:49 -0800 (PST)
MIME-Version: 1.0
References: <20241211153955.33518-1-tjarlama@gmail.com>
 <20241211153955.33518-3-tjarlama@gmail.com>
In-Reply-To: <20241211153955.33518-3-tjarlama@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Dec 2024 16:55:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XZA-16JJU-CZGBtqZnQNhZ3Uv29VUdPhbDp1x2Mforcw@mail.gmail.com>
X-Gm-Features: AbW1kvbUF595ctLi_r_y4OzGLCoepX601ov6HOKOsSq80mpxxsyGl0fjgF1PuZs
Message-ID: <CAD=FV=XZA-16JJU-CZGBtqZnQNhZ3Uv29VUdPhbDp1x2Mforcw@mail.gmail.com>
To: Amal Raj T <tjarlama@gmail.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Dec 11, 2024 at 7:40 AM Amal Raj T <tjarlama@gmail.com>
    wrote: > > From: Amal Raj T <amalrajt@meta.com> > > The current implementation
    of `poll_put_char` in the serial console driver > perfo [...] 
 
 Content analysis details:   (-0.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.48 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.48 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.167.48 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.167.48 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tLtyJ-00046W-Bg
Subject: Re: [Kgdb-bugreport] [PATCH v2 2/3] serial: Move LF -> CRLF
 replacement from serial console to kdb
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
Y29tPgo+Cj4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgYHBvbGxfcHV0X2NoYXJgIGlu
IHRoZSBzZXJpYWwgY29uc29sZSBkcml2ZXIKPiBwZXJmb3JtcyBMRiAtPiBDUkxGIHJlcGxhY2Vt
ZW50LCB3aGljaCBjYW4gY29ycnVwdCBiaW5hcnkgZGF0YS4gU2luY2Uga2RiCj4gaXMgdGhlIG9u
bHkgdXNlciBvZiBgcG9sbF9wdXRfY2hhcmAsIHRoaXMgcGF0Y2ggbW92ZXMgdGhlIExGIC0+IENS
TEYKPiByZXBsYWNlbWVudCBsb2dpYyB0byBrZGIuCj4KPiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1kZWJ1Z2dlcnMvWnkwOTNqVktQczlnU1Z4MkB0ZWxlY2FzdGVyLwo+Cj4g
U2lnbmVkLW9mZi1ieTogQW1hbCBSYWogVCA8YW1hbHJhanRAbWV0YS5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvdHR5L3NlcmlhbC9zZXJpYWxfY29yZS5jIHwgMiAtLQo+ICBrZXJuZWwvZGVidWcva2Ri
L2tkYl9pby5jICAgICAgICB8IDIgKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpMb29rcyByZWFzb25hYmxlLiBJZiBzb21lb25lIGNvbWVzIG91
dCBvZiB0aGUgd29vZHdvcmsgYW5kIHNheXMgdGhhdAp0aGlzIGJyZWFrcyB0aGVtIHRoZW4gd2Ug
Y2FuIHRyeSB0byBmaWd1cmUgb3V0IGEgc29sdXRpb24gYXMgdGFsa2VkCmFib3V0IHByZXZpb3Vz
bHkgWzFdLiBJdCB3b3VsZCBiZSBuaWNlIHRvIGluY2x1ZGUgYSBsaW5rIHRvIHRoZQpwcmV2aW91
cyBjb252ZXJzYXRpb24gaW4geW91ciBjb21tZW50IG1lc3NhZ2UuLi4KCldpdGggdGhlIHJlZmVy
ZW5jZSB0byB0aGUgcHJldmlvdXMgY29udmVyc2F0aW9uOgoKUmV2aWV3ZWQtYnk6IERvdWdsYXMg
QW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KClsxXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9yLzIwMjQxMTE1MTQ0OTMzLkdCNDQwOEBhc3Blbi5sYW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxp
c3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
