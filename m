Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 978818AD9C7
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Apr 2024 01:58:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rz3Yg-000139-M6
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 22 Apr 2024 23:58:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1rz3Yf-00012t-Ho
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 23:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YK1IULy+gt9h3QAWRMC7n0H7pNm41l4ocPRhnJtOinw=; b=Mlagcbwa5fxP5rfIge/aCBmeNj
 r3O1nVa7mkGJ4iPzfUbdw682zkUUkFxQFnjFK/np0is/PDmOgWAPcAZ+wI825yq/JYd01AfjERhoN
 b6At4hCeXfX576AwMo+d3+Qyg74tObBaHZVTmAWBJneRYVR8QOb5ffDWqe58IGojQdO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YK1IULy+gt9h3QAWRMC7n0H7pNm41l4ocPRhnJtOinw=; b=TN4cZRS9YdM9O2C4IW+POX6Ad3
 KNcHSIC2/aXxnTgQFYThKoPCAtJXSJ+RX2UwR6B9phKJ+v1Up/x4kzHpAiHikldykYkY159RcHli3
 FbsWBjysEOaIq26FsuRaYK7uXbZATJKVCip7I5sj5QYbz9OkEEzMrtQE0bDAu+GUrB8g=;
Received: from mail-yb1-f169.google.com ([209.85.219.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rz3Ye-0003lx-TV for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 23:58:50 +0000
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-de528effbfbso1712314276.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 16:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713830323; x=1714435123;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YK1IULy+gt9h3QAWRMC7n0H7pNm41l4ocPRhnJtOinw=;
 b=Fuk7K2aeGPtkSw50eAnO9eU8DDBoUCkRjL/Fb3TO9i7SiuD5SfMmwd/F8aBCaNAsXv
 MyQ/hNq1IpHo9RRoXN0v1YsaA6OofLI5igA3kDxb4A/L6coAP/kva0RCgdMuyemeZ+dK
 1IshWibS0zBIhnc3+wxC5cTOA28MDsgIsy9XY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713830323; x=1714435123;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YK1IULy+gt9h3QAWRMC7n0H7pNm41l4ocPRhnJtOinw=;
 b=UXYwA11hZWVmXbfVqtU6d094nER3AgVhzekCwduOo1LG5f8nggn2I1Tnnqnfk3qd4f
 BMNf/G6B0DVolZ0A/XT8pNEcDmMzi8T3b4kLnKario9bVnsg58EhxQpzWdXLY8dpJ1AB
 vQHPVtn1i2iDi/wJkjalEVLHCfaQIzs4FyHvxwZvQEIu1x09yOmbxE3ke2tb++PFuKu9
 6VOcUVSgbs0bxWBd4I/ULSP7NBq5mHqdTE1hr+IHzn8S2axXjsP+ozm95/oJdOrymw1P
 e5MAedzRsfWgqXL3cuH9Reu9Bq4t3IGBVzn0t+kRDPcU2noNWZPKdHtwMpWW3+/is7RA
 AyvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmP9B/qNkk9F7abWyGfJWJ+VmejPLmQh6RvNFIuEeHn8VaLQSerBWi/kPDShPuJD4OGMMmA6sQFM+HC3nR2oFZzTq+y+7D+dg81Eo2UZy44hhPKTM=
X-Gm-Message-State: AOJu0Yz6qiefl5weIKWJ0F2usXI4jcoC37c/JHIl06PIzzAXhYmSSio6
 LtOb1gN+MF//uvodcfMMXTlxlpcRfQa5QfylSHyblkKoRHpap7ggfZe/BqBOEZaB539cC53Mwst
 dfJgT
X-Google-Smtp-Source: AGHT+IGQmB9XBoBqRSPHQEnu/puszc8V3K6s72pmZWowrm+tto1NeV+9HFK0xXqs5v6/5nU7F34XsA==
X-Received: by 2002:ae9:e70e:0:b0:78e:c312:4cc4 with SMTP id
 m14-20020ae9e70e000000b0078ec3124cc4mr12449207qka.73.1713829958180; 
 Mon, 22 Apr 2024 16:52:38 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174]) by smtp.gmail.com with ESMTPSA id
 pa9-20020a05620a830900b0078ede19b680sm4741658qkn.75.2024.04.22.16.52.37
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 16:52:37 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-436ed871225so71721cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 16:52:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVEsFkZ7H+WrWpDyaBAWZ4A4SeCH7KDQw/EZ9k4EEcoBbePIXspteW5itWhMra+ZPF6d4Zdw9bsgC0w5WD/L2s6cbHlPAUr112/6AGMn5n50XV2lLo=
X-Received: by 2002:a05:622a:810b:b0:437:74fd:bd26 with SMTP id
 jx11-20020a05622a810b00b0043774fdbd26mr119139qtb.14.1713829957071; Mon, 22
 Apr 2024 16:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
 <20240422-kgdb_read_refactor-v2-4-ed51f7d145fe@linaro.org>
In-Reply-To: <20240422-kgdb_read_refactor-v2-4-ed51f7d145fe@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Apr 2024 16:52:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UnvAxOmbM50yADmzE7qgCZXW-Y+-jAQ3ngO=01=m1fsA@mail.gmail.com>
Message-ID: <CAD=FV=UnvAxOmbM50yADmzE7qgCZXW-Y+-jAQ3ngO=01=m1fsA@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Apr 22, 2024 at 9:38 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > The code that handles case 14 (down) and case 16 (up) has been
    copy and > pasted despite being byte-for-byte i [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: chromium.org]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [209.85.219.169 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.169 listed in wl.mailspike.net]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rz3Ye-0003lx-TV
Subject: Re: [Kgdb-bugreport] [PATCH v2 4/7] kdb: Merge identical case
 statements in kdb_read()
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIEFwciAyMiwgMjAyNCBhdCA5OjM44oCvQU0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBUaGUgY29kZSB0aGF0IGhhbmRs
ZXMgY2FzZSAxNCAoZG93bikgYW5kIGNhc2UgMTYgKHVwKSBoYXMgYmVlbiBjb3B5IGFuZAo+IHBh
c3RlZCBkZXNwaXRlIGJlaW5nIGJ5dGUtZm9yLWJ5dGUgaWRlbnRpY2FsLiBDb21iaW5lIHRoZW0u
Cj4KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIE5vdCBhIGJ1ZyBmaXggYnV0IGl0IGlz
IG5lZWRlZCBmb3IgbGF0ZXIgYnVnIGZpeGVzCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFRob21w
c29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPiAtLS0KPiAga2VybmVsL2RlYnVnL2tk
Yi9rZGJfaW8uYyB8IDEwICstLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCA5IGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5k
ZXJzQGNocm9taXVtLm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
