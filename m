Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C72B89B12CB
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 26 Oct 2024 00:38:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t4SxM-0004lk-Jw
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 25 Oct 2024 22:38:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1t4SxL-0004ld-Qf
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Oct 2024 22:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ugvXr99oNQyERXTPqzKhuTsXIZd9WkdB8xJoxbh67vA=; b=A7HGgVGWDeY1LwJJudEYO0/j/D
 knQLbfPcybKSMCqZiFi9Oj1e75nHFHahbIxgQamMOrbOV++5i1HvSb2Pah4rtpdF7iJ0wj5h/7j/w
 Vi4cyskGPWWsSoUCs4Xnr4a3X2oLvK1VOfzXTIAqxXigLpUlztggIQqyH29QJyWZdYdo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ugvXr99oNQyERXTPqzKhuTsXIZd9WkdB8xJoxbh67vA=; b=jkIlIKf0hFhZ8awQo3DeZJwIa1
 sK7hA0u7D8reU2zrUdoLb9Is61rHsQ3TwUGsY/jYvtieHtPQvBzlL67yncDG1R0pzVqw+aX30dche
 QalHXZNT5SI+e9IwBnwAy4hukoHFeggebj0ha6VAUP+6F+xEQL4zh2E9CFPYZVzmTwRY=;
Received: from mail-ed1-f43.google.com ([209.85.208.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t4SxL-0000gu-4B for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Oct 2024 22:38:55 +0000
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5cb6ca2a776so3279537a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Oct 2024 15:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729895928; x=1730500728;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ugvXr99oNQyERXTPqzKhuTsXIZd9WkdB8xJoxbh67vA=;
 b=N7x2LwMbnUoeY+yCovTjumkIQ1QB3NEVfytxiQRzfpGG2zIXPcp28+CDWZOptTsfpO
 emCg8SV0dssujdk/J3UCId8cj5vGUyRHtElGu6C+oT0od16aZ+zWljhtJHvpmoBiBEqT
 bDgoPlxKTmxxAN7un0fpenO1soKbyCzxxHyIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729895928; x=1730500728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ugvXr99oNQyERXTPqzKhuTsXIZd9WkdB8xJoxbh67vA=;
 b=r8rF6vwzYeISkv/mHwnvJkxhfHUn8clX9v3P/oz7Ira2s/RubiZQv/Xwm3yq2CI8z5
 uV2CeGTJ3aQH9VzYsiGUWkhs+uV1UxiXriGNPc72i4uVa/W73jalKKMNw5LV43HKgwM9
 vUXg7h39ypwuMUNFmEz8SFNmHcZpkMPvM/s+T4P8FaTd1YO2/8RJ/fCjtzBPFuGqCWqU
 QF90BmCP6Qr+r/D2Mt7USnYOxkx149as1SwiM5fOFhn99RDOjuOitjwC1xmFOrW/cMde
 oJS3UtIFSJfegc+1X87b77lH2MK2aoCtAS6ldxX42ApDingTTj9zXDLXc0B90orfJnlQ
 iIsA==
X-Gm-Message-State: AOJu0YxnKdkHrAZlEDUzEjKc/4fqF2FAtXidBeJfVWrUBaHQARw6w4iN
 pM87TUymmNoiq8Mg+0VD/C5FRxQK065l494ozzgyoCx2bQUoIzXoLmS76HinW0MHPdoW/SbTROR
 dOw==
X-Google-Smtp-Source: AGHT+IEtAYAfUdvTjFGOpYjtT1cW3tJAz3lLNLDLiPKKDNugSc2CiyS0M4AOLOnSeKTXRSjVtNrEqQ==
X-Received: by 2002:a05:6512:238a:b0:535:6aa9:9868 with SMTP id
 2adb3069b0e04-53b348cb8d9mr488194e87.19.1729895489782; 
 Fri, 25 Oct 2024 15:31:29 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e124598sm331418e87.79.2024.10.25.15.31.28
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 15:31:29 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2fb4ec17f5cso24356301fa.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Oct 2024 15:31:28 -0700 (PDT)
X-Received: by 2002:a2e:be20:0:b0:2fb:5a19:5b9b with SMTP id
 38308e7fff4ca-2fcbdf5dademr3775951fa.8.1729895487832; Fri, 25 Oct 2024
 15:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241021211221.GA835676@lichtman.org>
In-Reply-To: <20241021211221.GA835676@lichtman.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Oct 2024 15:31:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X-BYpZb60Ap1xHXdoDtf=2UhTD=MQc8Lw=WkRmY=+wWQ@mail.gmail.com>
Message-ID: <CAD=FV=X-BYpZb60Ap1xHXdoDtf=2UhTD=MQc8Lw=WkRmY=+wWQ@mail.gmail.com>
To: Nir Lichtman <nir@lichtman.org>
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Oct 21, 2024 at 2:12 PM Nir Lichtman <nir@lichtman.org>
    wrote: > > The simple_str* family of functions perform no error checking
   in > scenarios where the input value overflows the intended o [...] 
 
 Content analysis details:   (-2.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.43 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.43 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t4SxL-0000gu-4B
Subject: Re: [Kgdb-bugreport] [PATCH v2 0/2] Replace the use of
 simple_strtol/ul functions with kstrto
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
Cc: daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, mhiramat@kernel.org,
 jason.wessel@windriver.com, yuran.pereira@hotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIE9jdCAyMSwgMjAyNCBhdCAyOjEy4oCvUE0gTmlyIExpY2h0bWFuIDxuaXJA
bGljaHRtYW4ub3JnPiB3cm90ZToKPgo+IFRoZSBzaW1wbGVfc3RyKiBmYW1pbHkgb2YgZnVuY3Rp
b25zIHBlcmZvcm0gbm8gZXJyb3IgY2hlY2tpbmcgaW4KPiBzY2VuYXJpb3Mgd2hlcmUgdGhlIGlu
cHV0IHZhbHVlIG92ZXJmbG93cyB0aGUgaW50ZW5kZWQgb3V0cHV0IHZhcmlhYmxlLgo+IFRoaXMg
cmVzdWx0cyBpbiB0aGVzZSBmdW5jdGlvbiBzdWNjZXNzZnVsbHkgcmV0dXJuaW5nIGV2ZW4gd2hl
biB0aGUKPiBvdXRwdXQgZG9lcyBub3QgbWF0Y2ggdGhlIGlucHV0IHN0cmluZy4KPgo+IE9yIGFz
IGl0IHdhcyBtZW50aW9uZWQgWzFdLCAiLi4uc2ltcGxlX3N0cnRvbCgpLCBzaW1wbGVfc3RydG9s
bCgpLAo+IHNpbXBsZV9zdHJ0b3VsKCksIGFuZCBzaW1wbGVfc3RydG91bGwoKSBmdW5jdGlvbnMg
ZXhwbGljaXRseSBpZ25vcmUKPiBvdmVyZmxvd3MsIHdoaWNoIG1heSBsZWFkIHRvIHVuZXhwZWN0
ZWQgcmVzdWx0cyBpbiBjYWxsZXJzLiIKPiBIZW5jZSwgdGhlIHVzZSBvZiB0aG9zZSBmdW5jdGlv
bnMgaXMgZGlzY291cmFnZWQuCj4KPiBUaGlzIHBhdGNoIHNlcmllcyByZXBsYWNlcyB1c2VzIG9m
IHRoZSBzaW1wbGVfc3RydG8qIHNlcmllcyBvZiBmdW5jdGlvbgo+IHdpdGggdGhlIHNhZmVyICBr
c3RydG8qIGFsdGVybmF0aXZlcy4KPgo+Cj4gWzFdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9j
L2h0bWwvbGF0ZXN0L3Byb2Nlc3MvZGVwcmVjYXRlZC5odG1sI3NpbXBsZS1zdHJ0b2wtc2ltcGxl
LXN0cnRvbGwtc2ltcGxlLXN0cnRvdWwtc2ltcGxlLXN0cnRvdWxsCj4KPiBZdXJhbiBQZXJlaXJh
ICgyKToKPiAgIGtkYjogUmVwbGFjZSB0aGUgdXNlIG9mIHNpbXBsZV9zdHJ0byB3aXRoIHNhZmVy
IGtzdHJ0byBpbiBrZGJfbWFpbgo+ICAgdHJhY2U6IGtkYjogUmVwbGFjZSBzaW1wbGVfc3RydG91
bCB3aXRoIGtzdHJ0b3VsIGluIGtkYl9mdGR1bXAKPgo+IHYyOiBOaXIgTGljaHRtYW4gKDIpOiBS
ZW1vdmVkIGNvbmZ1c2luZyBzdXBwb3J0IGZvciBoZXggbnVtYmVyIGlucHV0cyB3aXRoIG5vIHBy
ZWNlZGluZyAiMHgiLCBhbmQgb3RoZXIgQ1IgZml4ZXMKPgo+ICBrZXJuZWwvZGVidWcva2RiL2tk
Yl9tYWluLmMgfCA2OSArKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBrZXJu
ZWwvdHJhY2UvdHJhY2Vfa2RiLmMgICAgfCAxNSArKystLS0tLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA2MSBkZWxldGlvbnMo
LSkKCkZXSVcsIHNvbWV0aGluZyBhYm91dCB0aGUgd2F5IHlvdSdyZSBzZW5kaW5nIHlvdXIgcGF0
Y2hlcyBpcyBicm9rZW4uCkJvdGggcGF0Y2ggIzEgYW5kIHBhdGNoICMyIGFyZSBzdXBwb3NlZCB0
byBiZSAiSW4tUmVwbHktVG8iIHRoZSBjb3ZlcgpsZXR0ZXIuIFlvdSBzaG91bGQgdXNlIGEgdG9v
bCBsaWtlICJiNCIgb3IgInBhdG1hbiIgdG8gaGVscCB5b3UgcG9zdApwYXRjaGVzLgoKV2l0aCB3
aGF0IHlvdSBoYXZlIGlmIEkgdHJ5IHRvIGFwcGx5IHlvdXIgc2VyaWVzIGJ5IHBvaW50aW5nIGF0
IHRoZQpjb3ZlciBsZXR0ZXI6CgotLQoKJCBiNCBhbSAyMDI0MTAyMTIxMTIyMS5HQTgzNTY3NkBs
aWNodG1hbi5vcmcKQW5hbHl6aW5nIDEgbWVzc2FnZXMgaW4gdGhlIHRocmVhZApObyBwYXRjaGVz
IGZvdW5kLgoKLS0KCi4uLmFuZCBpZiBJIHRyeSB3aXRoIHBhdGNoICMxOgoKLS0KCiQgYjQgYW0g
MjAyNDEwMjEyMTE0NTEuR0I4MzU2NzZAbGljaHRtYW4ub3JnCkdyYWJiaW5nIHRocmVhZCBmcm9t
CmxvcmUua2VybmVsLm9yZy9hbGwvMjAyNDEwMjEyMTE0NTEuR0I4MzU2NzZAbGljaHRtYW4ub3Jn
L3QubWJveC5negpBbmFseXppbmcgMSBtZXNzYWdlcyBpbiB0aGUgdGhyZWFkCkxvb2tpbmcgZm9y
IGFkZGl0aW9uYWwgY29kZS1yZXZpZXcgdHJhaWxlcnMgb24gbG9yZS5rZXJuZWwub3JnCkNoZWNr
aW5nIGF0dGVzdGF0aW9uIG9uIGFsbCBtZXNzYWdlcywgbWF5IHRha2UgYSBtb21lbnQuLi4KLS0t
CiAg4pyTIFtQQVRDSCB2MiAxLzJdIGtkYjogUmVwbGFjZSB0aGUgdXNlIG9mIHNpbXBsZV9zdHJ0
byB3aXRoIHNhZmVyCmtzdHJ0byBpbiBrZGJfbWFpbgogICAg4pyTIFNpZ25lZDogREtJTS9saWNo
dG1hbi5vcmcKICBFUlJPUjogbWlzc2luZyBbMi8yXSEKLS0tClRvdGFsIHBhdGNoZXM6IDEKLS0t
CldBUk5JTkc6IFRocmVhZCBpbmNvbXBsZXRlIQogTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI0MTAyMTIxMTQ1MS5HQjgzNTY3NkBsaWNodG1hbi5vcmcKIEJhc2U6IGFwcGxpZXMg
Y2xlYW4gdG8gY3VycmVudCB0cmVlCiAgICAgICBnaXQgY2hlY2tvdXQgLWIgdjJfMjAyNDEwMjFf
bmlyX2xpY2h0bWFuX29yZyBIRUFECiAgICAgICBnaXQgYW0gLi92Ml8yMDI0MTAyMV9uaXJfa2Ri
X3JlcGxhY2VfdGhlX3VzZV9vZl9zaW1wbGVfc3RydG9fd2l0aF9zYWZlcl9rc3RydG9faW5fa2Ri
X21haW4ubWJ4CgotLQoKSWYgdGhleSB3ZXJlIHByb3Blcmx5IHBvc3RlZCBiNCB3b3VsZCBiZSBh
YmxlIHRvIGZpbmQgYWxsIG9mIHRoZW0uCgotRG91ZwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2Ri
LWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
