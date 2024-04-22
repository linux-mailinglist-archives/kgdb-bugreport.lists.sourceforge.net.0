Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD94A8ADABA
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Apr 2024 02:19:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rz3t8-00040k-An
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 23 Apr 2024 00:19:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1rz3t6-00040X-4R
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 Apr 2024 00:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mFMZDFCKqtRsg+Es89BVufKPl3Pj2valoSZO9ZIhMr8=; b=C3+4uMj7HG0DRmmlm/7E1Gv4fV
 jIXpygPBKGpgyu7kNq7k5ppTSw7G8UBlsyT4zMl73Drm5kh9/JPdL5i0MuxP7AH1vqoV1y6TB0xaC
 fklMwtEd6aUGEaENHivDFG6k44h5i4XqDBgWDcSxFqGE2McuL6V26pT6oJaJ/03dS4TM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mFMZDFCKqtRsg+Es89BVufKPl3Pj2valoSZO9ZIhMr8=; b=BLKa7nbttuiz3DWlOg7OgdYzoD
 /40mSxPa3kGkN6o36EkFIK1SfC61gADKCF6bSbMCXtPBbz2srZ5d91par6oGqQ1ckbfTGDtCD7AWL
 TT8XCqy/6L5abBXt+Ovfotu9SMHNl/zbKIKqnr+xNoyZ2Z6iM/YQTU5rgf/ZHwqvKqXk=;
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rz3t5-0004r8-0A for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 Apr 2024 00:19:56 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-6eb7ee5a776so3001081a34.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 17:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713831584; x=1714436384;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mFMZDFCKqtRsg+Es89BVufKPl3Pj2valoSZO9ZIhMr8=;
 b=Gl/Ln4kLMNEZmjnhxXhS0c7q86czZvbuI1Z3vyMVCzoQTYErmoYlicieNFft8svHVb
 vspfVGew4+qJ9PiE7af4el6geTE/niG9jID8mA5rkth5I09WC6ZEu8qdtrxPV1gm0gHh
 1rC1sgoIiWMCkwcOzEokuPAdgilSBCrfqm6yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713831584; x=1714436384;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mFMZDFCKqtRsg+Es89BVufKPl3Pj2valoSZO9ZIhMr8=;
 b=PuRtPRnWXlm8wp46tNUmgOVeLcMEVb9pBAVP+Gz9bSGCfxd4plxcKB/GN5SlBTsyXK
 VFYZgWc8jVPWivQXU50YBbxnqo8MBYUtH4cQihuyDdM1USwKyJERVYRrnedjjg0DRTiy
 QWoyIyshbxNy2J6SU+qRthFbBjC+jy+F4D6xZps78wqoafrx/9HzTdc146f1n+hntPnC
 E9/QvUL/QL2WqniArGLlUyKRBvOML9eIDHP6/wEDKMIss37uB/1ktg8ctEptSWCs4yPB
 hrxy151Z/2w7PyYeoDNS/q7eb/HPwCm+WZmuB/ZOcBNuuiP3gwlPmPDo/Mi6mEoQ3tX/
 +3EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFmPgyWXNFqE8E6JVBDG5oTcVoGy1qF9REVlKQ1JflL9CQP19umjRybmwgf79YSYe+jBp3CxvZSuqJfKGdJK5/cSUF5HAmv2d04v2DhGDqL9Z3a5g=
X-Gm-Message-State: AOJu0Yyt0XXtukW9rYaDq5pBWqulNSZZ05dMrUAqisIAzGC93dYzcNL2
 QBFOh84xEFynImnjjSxQfO82KQcnAUoIjxNaHBxU8A+Ah6FpmKxgpYRSR9O9GUeOfSsPN46GlSw
 mk6JS
X-Google-Smtp-Source: AGHT+IHBFnY7It+btpiwWZEdb8Q1URiRY0EziC/1vLEwGcsffXa48OEysXqxObdZ/ae5WDZHHQH1ag==
X-Received: by 2002:a05:620a:5e52:b0:78f:1482:3411 with SMTP id
 ya18-20020a05620a5e5200b0078f14823411mr13434888qkn.56.1713829925754; 
 Mon, 22 Apr 2024 16:52:05 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 vz6-20020a05620a494600b0078d6349aa03sm4759677qkn.103.2024.04.22.16.52.04
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 16:52:05 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-439b1c72676so100901cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 16:52:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWYXQgpoLO2Jql42AVeArGY4XwG/tv4JKyZlZVkpkxCJqWjI4xh8PPE8IGjvHKDnDKjEHmZCJYQAjeHJQgnrY4UAKqBI+z5m2+9zX5OQp9gYVXoG34=
X-Received: by 2002:a05:622a:50a7:b0:439:a613:c4fa with SMTP id
 fp39-20020a05622a50a700b00439a613c4famr129884qtb.18.1713829924524; Mon, 22
 Apr 2024 16:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
 <20240422-kgdb_read_refactor-v2-1-ed51f7d145fe@linaro.org>
In-Reply-To: <20240422-kgdb_read_refactor-v2-1-ed51f7d145fe@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Apr 2024 16:51:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VrOSN8VFaRwH-k4wCLm6Xb=zJyozJac+ijzhDvH8BYxA@mail.gmail.com>
Message-ID: <CAD=FV=VrOSN8VFaRwH-k4wCLm6Xb=zJyozJac+ijzhDvH8BYxA@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Apr 22, 2024 at 9:37 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > Currently, when the user attempts symbol completion with the Tab
    key, kdb > will use strncpy() to insert the c [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.210.44 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rz3t5-0004r8-0A
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/7] kdb: Fix buffer overflow during
 tab-complete
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
Cc: kgdb-bugreport@lists.sourceforge.net, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIEFwciAyMiwgMjAyNCBhdCA5OjM34oCvQU0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIHdoZW4gdGhl
IHVzZXIgYXR0ZW1wdHMgc3ltYm9sIGNvbXBsZXRpb24gd2l0aCB0aGUgVGFiIGtleSwga2RiCj4g
d2lsbCB1c2Ugc3RybmNweSgpIHRvIGluc2VydCB0aGUgY29tcGxldGVkIHN5bWJvbCBpbnRvIHRo
ZSBjb21tYW5kIGJ1ZmZlci4KPiBVbmZvcnR1bmF0ZWx5IGl0IHBhc3NlcyB0aGUgc2l6ZSBvZiB0
aGUgc291cmNlIGJ1ZmZlciByYXRoZXIgdGhhbiB0aGUKPiBkZXN0aW5hdGlvbiB0byBzdHJuY3B5
KCkgd2l0aCBwcmVkaWN0YWJseSBob3JyaWJsZSByZXN1bHRzLiBNb3N0IG9idmlvdXNseQo+IGlm
IHRoZSBjb21tYW5kIGJ1ZmZlciBpcyBhbHJlYWR5IGZ1bGwgYnV0IGNwLCB0aGUgY3Vyc29yIHBv
c2l0aW9uLCBpcyBpbgo+IHRoZSBtaWRkbGUgb2YgdGhlIGJ1ZmZlciwgdGhlbiB3ZSB3aWxsIHdy
aXRlIHBhc3QgdGhlIGVuZCBvZiB0aGUgc3VwcGxpZWQKPiBidWZmZXIuCj4KPiBGaXggdGhpcyBi
eSByZXBsYWNpbmcgdGhlIGR1YmlvdXMgc3RybmNweSgpIGNhbGxzIHdpdGggbWVtbW92ZSgpL21l
bWNweSgpCj4gY2FsbHMgcGx1cyBleHBsaWNpdCBib3VuZGFyeSBjaGVja3MgdG8gbWFrZSBzdXJl
IHdlIGhhdmUgZW5vdWdoIHNwYWNlCj4gYmVmb3JlIHdlIHN0YXJ0IG1vdmluZyBjaGFyYWN0ZXJz
IGFyb3VuZC4KPgo+IFJlcG9ydGVkLWJ5OiBKdXN0aW4gU3RpdHQgPGp1c3RpbnN0aXR0QGdvb2ds
ZS5jb20+Cj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FGaEdkOHFFU3V1
aWZ1SHNOakZQUi1WYTNQODBieHJ3K0xxdkM4ZGVBOEd6aVVKTHB3QG1haWwuZ21haWwuY29tLwo+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFRob21w
c29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPiAtLS0KPiAga2VybmVsL2RlYnVnL2tk
Yi9rZGJfaW8uYyB8IDIxICsrKysrKysrKysrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCkJveSwgdGhpcyBmdW5jdGlvbiAoYW5k
IGVzcGVjaWFsbHkgdGhlIHRhYiBoYW5kbGluZykgaXMgaGFyZCB0byByZWFkLgpJIHNwZW50IGEg
Yml0IG9mIHRpbWUgdHJ5aW5nIHRvIGdyb2sgaXQgYW5kLCBhcyBmYXIgYXMgSSBjYW4gdGVsbCwK
eW91ciBwYXRjaCBtYWtlcyB0aGluZ3MgYmV0dGVyIGFuZCBJIGRvbid0IHNlZSBhbnkgYnVncy4K
ClJldmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdy
ZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9y
dAo=
