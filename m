Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F11A1BEB9
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 24 Jan 2025 23:57:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tbSbm-0006jK-CK
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 24 Jan 2025 22:57:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1tbSb6-0006iA-1U
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 24 Jan 2025 22:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sDzAUQkLK+ll9FT+a7j+7HPNHM41+1WxQWQh7x0Fr48=; b=HKHTr0O4tPeG0OA8gVQtP3MQt/
 CNJhSd0l9flkExEP9G1CVTLK/LFDC0GUqQ6O9ZIGirGt1q0UgF+rBFU4DRc7bliUiWeDiQ39eScBo
 YJw11BHgxPEbR3snSumZaHgDvMppQTf4OWGGw4/dxgdHBaEKH7+XpjXzFf6yBm7ROdnU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sDzAUQkLK+ll9FT+a7j+7HPNHM41+1WxQWQh7x0Fr48=; b=aMn5n6IFCxOK5pYT5Jjc/7GgM4
 e2HzfbV0EXdoi309ImZLFwqeiAFIwzSufA3fwO6A9K8Ipw6w4qPq4jzs/rS1Js60M/eBa7dCarJZJ
 vx+8WK1NL7xk8r61sgKTs1Sz68l/zMY+nep7CCC48YjJcOBKHY5lXrStkPgTiVwXSqqY=;
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tbSar-0002WK-OV for kgdb-bugreport@lists.sourceforge.net;
 Fri, 24 Jan 2025 22:56:09 +0000
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-540218726d5so2815715e87.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 24 Jan 2025 14:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737759349; x=1738364149;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sDzAUQkLK+ll9FT+a7j+7HPNHM41+1WxQWQh7x0Fr48=;
 b=a6sLpGk2ZqwADJtXzsoO2ts6yXZrfCwAeEbug+Gen6MSB5+nU+fD9gmsKWDQJwhzeO
 LesA3eLEzOEfXs8BT4emtV6G53xxopZ9qDdFYxZyCpbDdyK804k2b32MUMcXZcLxgl8C
 C5M/Ix3ZBc2pJb3CeH1VqAJaOpB2ciW4S+OSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737759349; x=1738364149;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sDzAUQkLK+ll9FT+a7j+7HPNHM41+1WxQWQh7x0Fr48=;
 b=m94QwulqOl5U2JWbqzrRiwQoDNuzCxoVfHnWHngjLDrJxGNfGqiGvg3Bo+xb2FECAE
 8v7qHjjvTdbtxbLDCIm5IWAbNWlKR1KrpdF/CJSbF2BLvaN67YGJ7jiVKMbuDUDemrsV
 8obE07YPvpSolOZUaLnt5ok6RtlcS+Zwoql5RtsRL886hKqMpz8sxE0hpnldHEtI8uEH
 S61oh7XYYHHtsMP59xyZiEw1B/sDk32j2RiiXgMj7JKS95mTlw5IRf3CMTb1vopREujd
 qFrj9HnjtZAAYzZidDvQBuVSF5Wr1Wz1Vt7JgBJHYlqagcMUI7Rtnw6c9fyYmT4EgD9M
 38vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8wpzAmxU4E2XWviON7ombakVevIzheTe0hUQxQV40OJa0Ajurg9MvOV3Dl9gDpl0bL/kUdr4ZOZgXhhjbtA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw7TyuRpy5PURgxDBrL2V+e4yVBCzzbA68lcGrOnmgWeyC1Ovny
 wHGFp1n07vdB1zOZzjBzuM6sVJcFHxkUM89oMjEzaDer0BlcWbxISdu4EBOFxsPyAThQ2KhHeQI
 okQ==
X-Gm-Gg: ASbGncv8eTb6bfH4IuinkmS/qQtpTT+QjQmoXTPMGVepidewKhtjl7nDfuJQyI4iwdn
 1auP69PQx/6eAnT1P1P7Eexb/bdmOLiV0Tvru7j5InLQbbOpBifG3kSR+pnWNYRSxD0QKnebuT2
 o43AO8LuuJ5w3suQrPq1/PGYL590NgOozQESVeUWFolBJz/FX9TpqgrhcvgE1jeI5m1NFfRlZ6J
 L1JPtxBtbW5ww9k7ly7yGhNUYkQC/L/gX8vStDaYsONY552u1SGqgQZ9HbuZVe7D5ISjAor5sZy
 ZuEh/rIAHoY9ZTtcEUogBcMIVGNlFG+ShzMq1Hw0VELI
X-Google-Smtp-Source: AGHT+IELWSghU+Splutn2VQyl9xzwZfLIBLvN0aqICW9ZH+xcRd/j+vHYV0aeHcWLgA8k4VTgLipCQ==
X-Received: by 2002:ac2:5225:0:b0:542:1c1e:ea7f with SMTP id
 2adb3069b0e04-5439c22ca6amr9163420e87.9.1737759349000; 
 Fri, 24 Jan 2025 14:55:49 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c836878csm429164e87.143.2025.01.24.14.55.47
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 14:55:48 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5426fcb3c69so2201570e87.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 24 Jan 2025 14:55:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX4uPIi/4JGXOvETileOZr4f1TevNdQjaDGfQ6D3rhquLhsJ9S24bwlhIGqBMzsFe1UM5ID6yrDnoDm+TX97Q==@lists.sourceforge.net
X-Received: by 2002:ac2:4c24:0:b0:542:6507:9778 with SMTP id
 2adb3069b0e04-5439c22cb95mr8643147e87.11.1737759347161; Fri, 24 Jan 2025
 14:55:47 -0800 (PST)
MIME-Version: 1.0
References: <20250113172936.1434532-1-tjarlama@gmail.com>
 <20250113172936.1434532-4-tjarlama@gmail.com>
In-Reply-To: <20250113172936.1434532-4-tjarlama@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 24 Jan 2025 14:55:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UnGvwk7EVjDrqQdwUGX43Ep_BaLTbYy6SPNY26=QoLvg@mail.gmail.com>
X-Gm-Features: AWEUYZl5QQEDOJe9pjO5xpM1fvE182XEZ7q11PrSp6eM-M1_YsoDAPLI4evlW54
Message-ID: <CAD=FV=UnGvwk7EVjDrqQdwUGX43Ep_BaLTbYy6SPNY26=QoLvg@mail.gmail.com>
To: Amal Raj T <tjarlama@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Jan 13, 2025 at 9:29 AM Amal Raj T <tjarlama@gmail.com>
    wrote: > > From: Amal Raj T <amalrajt@meta.com> > > The current implementation
    of `poll_put_char` in the serial console driver > perfo [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.167.53 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.167.53 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.53 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.53 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1tbSar-0002WK-OV
Subject: Re: [Kgdb-bugreport] [PATCH v3 2/3] serial: Move LF -> CRLF
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

SGksCgpPbiBNb24sIEphbiAxMywgMjAyNSBhdCA5OjI54oCvQU0gQW1hbCBSYWogVCA8dGphcmxh
bWFAZ21haWwuY29tPiB3cm90ZToKPgo+IEZyb206IEFtYWwgUmFqIFQgPGFtYWxyYWp0QG1ldGEu
Y29tPgo+Cj4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgYHBvbGxfcHV0X2NoYXJgIGlu
IHRoZSBzZXJpYWwgY29uc29sZSBkcml2ZXIKPiBwZXJmb3JtcyBMRiAtPiBDUkxGIHJlcGxhY2Vt
ZW50LCB3aGljaCBjYW4gY29ycnVwdCBiaW5hcnkgZGF0YS4gU2luY2Uga2RiCj4gaXMgdGhlIG9u
bHkgdXNlciBvZiBgcG9sbF9wdXRfY2hhcmAsIHRoaXMgcGF0Y2ggbW92ZXMgdGhlIExGIC0+IENS
TEYKPiByZXBsYWNlbWVudCBsb2dpYyB0byBrZGIuCj4KPiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1kZWJ1Z2dlcnMvWnkwOTNqVktQczlnU1Z4MkB0ZWxlY2FzdGVyLwo+IC0t
LQo+ICBkcml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFsX2NvcmUuYyB8IDIgLS0KPiAga2VybmVsL2Rl
YnVnL2tkYi9rZGJfaW8uYyAgICAgICAgfCAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKWW91IHNlZW0gdG8gaGF2ZSBkcm9wcGVkIHlvdXIg
U2lnbmVkLW9mZi1ieT8gSXQgd2FzIHRoZXJlIG9uIFYyIFsxXS4KLi4uYW5kIHNwZWFraW5nIG9m
IFYyLCBJIHByb3ZpZGVkIG15IFJldmlld2VkLWJ5IHRoZXJlLiBZb3Ugc2hvdWxkCmhhdmUgY2Fy
cmllZCBpdCBmb3J3YXJkIHNpbmNlIHRoZXJlIGFyZSBubyBkaWZmZXJlbmNlcyBpbiB0aGUgY29k
ZQpiZXR3ZWVuIFYyIGFuZCBWMy4gSSBjYW4gZ2l2ZSBpdCBhZ2FpbiwgYnV0IGl0IHdvdWxkIGJl
IG5pY2Ugbm90IHRvCm5lZWQgdG8gcmVwZWF0IHdoZW4geW91IHNlbmQgdGhlIFY0LgoKT25jZSB5
b3UndmUgYWRkZWQgYmFjayB5b3VyIG93biBTaWduZWQtb2ZmLWJ5LCB5b3UgY2FuIGFsc28gYWRk
OgoKUmV2aWV3ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4K
Ci4uLmFsc28gc3BlYWtpbmcgb2YgVjIsIEkgZGlkIGFzayBpZiB5b3UgY291bGQgbWF5YmUgYWRk
IHNvbWV0aGluZyB0bwp0aGUgY29tbWl0IG1lc3NhZ2UgcG9pbnRpbmcgYXQgdGhlIHByZXZpb3Vz
IGRpc2N1c3Npb24uIElmIHlvdSByZWFsbHkKaGF2ZSBhIHJlYXNvbiBub3QgdG8gZG8gdGhpcyBJ
IHdvbid0IGluc2lzdCwgYnV0IGl0IHdvdWxkIGJlIG5pY2UgdG8KaW5jbHVkZSBpdC4uLgoKWzFd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MTIxMTE1Mzk1NS4zMzUxOC0zLXRqYXJs
YW1hQGdtYWlsLmNvbS8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2tnZGItYnVncmVwb3J0Cg==
