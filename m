Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9599D706D17
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 May 2023 17:44:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pzJJs-0003Sk-77
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 17 May 2023 15:44:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pzJJq-0003Sd-VW
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 May 2023 15:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/xeS9KwC8vW2y0J+xxczH/UzoaJDpNT/4GWb3cUgqXk=; b=j9gTA+IfP4761tl9r0hR6qIpeu
 Dijy35f7JO4tnFv0C55usNNARjEO159lpLP/y6SfoBSQTYF8fhIwnNbGmMKiPaDXT3n1W+/wIy9yR
 ltOZbMgb8j/LuZ2tYHap6lEHMXZB5qpa5UFL0rZRmcZjkPosbqu4mbQsGA1ndRSrxZr4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/xeS9KwC8vW2y0J+xxczH/UzoaJDpNT/4GWb3cUgqXk=; b=QmeR0ahOMWC1nAeyVsfrCFuZnJ
 jiZFM5iiqAp1smOqpHLfpLisIUrz+AMFv3HC0Voq6wEw6Lreo+MwwmFx7dc1g6IIA8azfyTAouB6O
 NhO3TeDO4aI6C2ZuHPz7cTZ4kEkzgMyDxu3j8eQmCJ29BpHoY5z++d6nLjhU/y3gK3rQ=;
Received: from mail-qk1-f180.google.com ([209.85.222.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pzJJp-00055S-VK for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 May 2023 15:44:02 +0000
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-75776686671so54469485a.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 17 May 2023 08:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684338234; x=1686930234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/xeS9KwC8vW2y0J+xxczH/UzoaJDpNT/4GWb3cUgqXk=;
 b=NSBvzMpq5pGZtSDvil9rUpMWJrztHiWlRnPH36fwzsewLZ3mIEFCC2DdNHo6G7SWvH
 /5c8NN3nXBhzI7pCSPOESZo8D2Zzdt8gMbOTwxLgwy35KBRX3PD5s0puTlqgfTIlQZlI
 1/82g13Qqbxd+Z+BQAwEPXsxaYg4rfnvYIbtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684338234; x=1686930234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xeS9KwC8vW2y0J+xxczH/UzoaJDpNT/4GWb3cUgqXk=;
 b=b4uSRe9zvf827Q48vygUVtIj5kG9EwyxcIPTq+gJYUVIafXcgbWBZypGbKC5UeGHQU
 z6z7Szmfrn/gE0cClLlmmsZPuzKJ2vS6NrTgEfUX7xlPB1WuphGIHe1s7m6+gyCLVC0o
 hAyaqyDuyRfXOZvAVlUilMhorBR694xvphSEACq7qHP6MKo9BP3RLUaM4g3AwLDn+/Ce
 9xOG+ZMDEmh+33O6DoC5da6mK7oKg83mgUgum0gIHviGxZ9Znda6H1z3yCpsEqzq7dAS
 1KeScfUcLIKbhY5oril1JorfhDebZpySaKPEL+sC1qEeYQBw2sGuB5w06/T+C5+eHN7H
 VVQA==
X-Gm-Message-State: AC+VfDyDqaQQ0Y0ryhemlnE/vgOfwHJBkPkmtAVFovh5ovWvFzCPScwe
 FL20AAteX67SfG9YhQ1JJTkXXgzRqUzm+M4oMug=
X-Google-Smtp-Source: ACHHUZ6yFkT9yCcTkF2krXORES59CBATma3rW9C7H3oOnx5swKGIsJAv87Ect1WxTXN8XmC6J5K7mg==
X-Received: by 2002:ad4:5ecb:0:b0:621:2478:f75a with SMTP id
 jm11-20020ad45ecb000000b006212478f75amr27886qvb.45.1684338234658; 
 Wed, 17 May 2023 08:43:54 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com.
 [209.85.160.172]) by smtp.gmail.com with ESMTPSA id
 f21-20020a0caa95000000b005f2dba7a5b0sm6424872qvb.132.2023.05.17.08.43.53
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 08:43:54 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-3f38a9918d1so165031cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 17 May 2023 08:43:53 -0700 (PDT)
X-Received: by 2002:a05:622a:144b:b0:3ef:31a5:13c with SMTP id
 v11-20020a05622a144b00b003ef31a5013cmr262636qtx.3.1684338233391; Wed, 17 May
 2023 08:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230517124802.929751-1-arnd@kernel.org>
In-Reply-To: <20230517124802.929751-1-arnd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 May 2023 08:43:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X8pAgFUngLd475d9-zkF13Fzs35-O4tCSHR+jX4YBBXw@mail.gmail.com>
Message-ID: <CAD=FV=X8pAgFUngLd475d9-zkF13Fzs35-O4tCSHR+jX4YBBXw@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, May 17, 2023 at 5:48 AM Arnd Bergmann <arnd@kernel.org>
    wrote: > > From: Arnd Bergmann <arnd@arndb.de> > > The kdb_kbd_cleanup_state()
    is called from another file through > the kdb_private.h [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.180 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.180 listed in wl.mailspike.net]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pzJJp-00055S-VK
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: include kdb_private.h for
 function prototypes
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
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIE1heSAxNywgMjAyMyBhdCA1OjQ44oCvQU0gQXJuZCBCZXJnbWFubiA8YXJu
ZEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+Cj4KPiBUaGUga2RiX2tiZF9jbGVhbnVwX3N0YXRlKCkgaXMgY2FsbGVkIGZyb20gYW5vdGhl
ciBmaWxlIHRocm91Z2gKPiB0aGUga2RiX3ByaXZhdGUuaCBmaWxlLCBidXQgdGhhdCBpcyBub3Qg
aW5jbHVkZWQgYmVmb3JlIHRoZQo+IGRlZmluaXRpb24sIGNhdXNpbmcgYSBXPTEgd2FybmluZzoK
Pgo+IGtlcm5lbC9kZWJ1Zy9rZGIva2RiX2tleWJvYXJkLmM6MTk4OjY6IGVycm9yOiBubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yICdrZGJfa2JkX2NsZWFudXBfc3RhdGUnIFstV2Vycm9yPW1pc3Np
bmctcHJvdG90eXBlc10KPgo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+Cj4gLS0tCj4gIGtlcm5lbC9kZWJ1Zy9rZGIva2RiX2tleWJvYXJkLmMgfCAyICsrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKClJldmlld2VkLWJ5OiBEb3VnbGFzIEFu
ZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGIt
YnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
