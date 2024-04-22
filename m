Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FCA8AD95A
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Apr 2024 01:52:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rz3Sf-000150-Gs
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 22 Apr 2024 23:52:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1rz3Se-00014r-8H
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 23:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9SOhZEZT4NIqKamiAK6hc1pW5omVtcjx/7H0PT95lRc=; b=jND9ke/GoLF5bkhorvXmq+tyLY
 41unvtnnLdnZNAg2brPPjIGM5l0s7sPa1Rp2LjemD8V6ezt6mMGGvoT/zCbRl1CWL2+O9Dax0L5vk
 zObKLhp57sk/Tg7PIGrPpZkQDP+Rxzmd1BaeMnnMXezPM6IwRtM/bgrutdYk9M4Sugjo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9SOhZEZT4NIqKamiAK6hc1pW5omVtcjx/7H0PT95lRc=; b=lSRsYbH9QqE/KJGcZc2zQgaHDy
 Fpq5vu/6STR9XK3NlEEWSTBI0MiHNqMjkcZGoS8rYdNsCUYek9jLjCgEJ84TDrStPpOKARn/uFkBT
 7NO4VJ+b0Y+hz9E5FVXCHII82rzwHClBubmBMOuwqbKUgEJVtkzShKNQ+i8yGCi9pPf4=;
Received: from mail-qt1-f172.google.com ([209.85.160.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rz3Sd-0003TI-4P for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 23:52:36 +0000
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-434b7ab085fso46931711cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 16:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713829949; x=1714434749;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9SOhZEZT4NIqKamiAK6hc1pW5omVtcjx/7H0PT95lRc=;
 b=cOQvw02mpf9/4/KHkxoczw8ATEos/uTYXVmjnGOhwIANsvSPhcwASapSBHUb0CPnJi
 yFIcAuS65ca61oZ1us2Q05C/ld+OrUjW/K3IoeqYxGMmSDBqoVanMX3rZtfbrGi/ffdW
 8M9hWTERE7+5hPI+UxJ9wFDqvm1sMhI8q60qM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713829949; x=1714434749;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9SOhZEZT4NIqKamiAK6hc1pW5omVtcjx/7H0PT95lRc=;
 b=MQ49LL0vwoXjeTixd9HetiByBC/BOsDOqSMSF9g44COLr96BtUzP39NL8s2jx5PBcF
 eGfA6EYSKwXMsRA3qQ9pOexsh0ntuX317TjmoBCGfent95QC5NqROCST74Cjkq9/7C1Z
 KN38SnvXVJiuaDb6ktIA16KTA6w6sX2+d00oVKJ6xQpTb+05sjCn2NJ/1rjel5qqJd8R
 SrrIoBqmC+861N4r5owMXIdr0IU7nCB71G7Z+fZaj9L8nCPl5igqh7OeaA3mag/QWHBY
 KRHG1QYBq9FcI7VQiZC512dkplEHGovJoxGcevgn/31E+pE1XvwRidAwb0OpXehCXKfG
 d5Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ5OYi965yfZxEHiEurlLsU4+winwerSNg4qYzAWjeC202vStpLZwSdnE2moi5Kqht7HsO0QAliwYXvMrqHz6agS2BVrsItJwrWPwNLyJf935zofo=
X-Gm-Message-State: AOJu0YwIT0yo/huSS8x3juk1O8Ev2cjdeg25yS5hh27yD1H1bFzv3k0r
 uigjseEJQyM4AviWHPa5Utc/6FOOuPhvhJpy6m21UfMAIC5O0NTJhkNosS+FQnbPaNwoKhfssg+
 mttGs
X-Google-Smtp-Source: AGHT+IGg1COA5EI4Flg5K1QxMzOIrX3MdVMaFVtJ+zLnz12Sp0Z/BxBkPIm9h3Vgcf2BcLuKDn9RyQ==
X-Received: by 2002:a05:622a:298e:b0:439:baf4:619a with SMTP id
 hd14-20020a05622a298e00b00439baf4619amr2326037qtb.22.1713829948948; 
 Mon, 22 Apr 2024 16:52:28 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 l16-20020ac84590000000b00439da286b2asm599004qtn.97.2024.04.22.16.52.28
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 16:52:28 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-43989e6ca42so139801cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 16:52:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV5qtP5EaDGaDMBQluWndIssFsse8FnYRANQwmFCYbClgK9m1/7Ghugk97dsinsTfKAL7oYCJ3CQZYlHO1q+Jy8v/Zcw86s3OHTSCVqL/LVPsdv2xI=
X-Received: by 2002:a05:622a:8030:b0:437:a0fc:8989 with SMTP id
 jr48-20020a05622a803000b00437a0fc8989mr125978qtb.4.1713829947957; Mon, 22 Apr
 2024 16:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
 <20240422-kgdb_read_refactor-v2-3-ed51f7d145fe@linaro.org>
In-Reply-To: <20240422-kgdb_read_refactor-v2-3-ed51f7d145fe@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Apr 2024 16:52:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X7TnwD+K5UiUqVz6E06A82uimDoHfQ28557857QE6P0A@mail.gmail.com>
Message-ID: <CAD=FV=X7TnwD+K5UiUqVz6E06A82uimDoHfQ28557857QE6P0A@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Apr 22, 2024 at 9:37 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > Currently, if the cursor position is not at the end of the command
    buffer > and the user uses the Tab-complete [...] 
 
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
                             [209.85.160.172 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.160.172 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rz3Sd-0003TI-4P
Subject: Re: [Kgdb-bugreport] [PATCH v2 3/7] kdb: Fix console handling when
 editing and tab-completing commands
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

SGksCgpPbiBNb24sIEFwciAyMiwgMjAyNCBhdCA5OjM34oCvQU0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIGlmIHRoZSBj
dXJzb3IgcG9zaXRpb24gaXMgbm90IGF0IHRoZSBlbmQgb2YgdGhlIGNvbW1hbmQgYnVmZmVyCj4g
YW5kIHRoZSB1c2VyIHVzZXMgdGhlIFRhYi1jb21wbGV0ZSBmdW5jdGlvbnMsIHRoZW4gdGhlIGNv
bnNvbGUgZG9lcyBub3QKPiBsZWF2ZSB0aGUgY3Vyc29yIGluIHRoZSBjb3JyZWN0IHBvc2l0aW9u
Lgo+Cj4gRm9yIGV4YW1wbGUgY29uc2lkZXIgdGhlIGZvbGxvd2luZyBidWZmZXIgd2l0aCB0aGUg
Y3Vyc29yIHBvc2l0aW9uZWQKPiBhdCB0aGUgXjoKPgo+IG1kIGtkYl9wcm8gMTAKPiAgICAgICAg
ICAgXgo+Cj4gUHJlc3NpbmcgdGFiIHNob3VsZCByZXN1bHQgaW46Cj4KPiBtZCBrZGJfcHJvbXB0
X3N0ciAxMAo+ICAgICAgICAgICAgICAgICAgXgo+Cj4gSG93ZXZlciB0aGlzIGRvZXMgbm90IGhh
cHBlbi4gSW5zdGVhZCB0aGUgY3Vyc29yIGlzIHBsYWNlZCBhdCB0aGUgZW5kCj4gKGFmdGVyIHRo
ZW4gMTApIGFuZCBmdXJ0aGVyIGN1cnNvciBtb3ZlbWVudCByZWRyYXdzIGluY29ycmVjdGx5LiBU
aGUKPiBzYW1lIHByb2JsZW0gZXhpc3RzIHdoZW4gd2UgZG91YmxlLVRhYiBidXQgaW4gYSBkaWZm
ZXJlbnQgcGFydCBvZiB0aGUKPiBjb2RlLgo+Cj4gRml4IHRoaXMgYnkgc2VuZGluZyBhIGNhcnJp
YWdlIHJldHVybiBhbmQgdGhlbiByZWRpc3BsYXlpbmcgdGhlIHRleHQgdG8KPiB0aGUgbGVmdCBv
ZiB0aGUgY3Vyc29yLgo+Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+IC0tLQo+
ICBrZXJuZWwvZGVidWcva2RiL2tkYl9pby5jIHwgNSArKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspCgpSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNA
Y2hyb21pdW0ub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8va2dkYi1idWdyZXBvcnQK
