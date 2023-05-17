Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCB4706D16
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 May 2023 17:43:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pzJJe-0001UT-TI
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 17 May 2023 15:43:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pzJJd-0001UN-0P
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 May 2023 15:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9FbpSjYQddUQnSYRkxb3E42SH+gBskrRUrxlf2CYvQo=; b=IWhjLXJg2hZGN56eHd0GXZOThw
 LChNln1phIgbqdeizM1o7sYrChqlQrdDeUp/vge6yzLe6Si4ahI4Me5BOPK/GPShBrCTqvM8P3Jvr
 KEo4Xd7OYU+D4LdrN0OXBNf9B1v3zw2fh9C74CGweQQcB9ievPb1ejXG5vPqJG8FBImI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9FbpSjYQddUQnSYRkxb3E42SH+gBskrRUrxlf2CYvQo=; b=RAWAD/nLeIL1KiY0NX18sWlZP1
 AVDWBlh/eQFrD3ordr+ruBihfypRQfnzoTTgCbjIoKfDw0IytR7YCL72VWsDCHkaIWammr8GctFbi
 AhIGuGqGbmy2Janx3w4QDuqgZ7TtZXExeuGAqr5Qjt/qDNZPCPlybBvyGC5p4xJJfjU8=;
Received: from mail-qt1-f180.google.com ([209.85.160.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pzJJc-00BFPb-NU for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 May 2023 15:43:49 +0000
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-3f38711680dso5821441cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 17 May 2023 08:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684338222; x=1686930222;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9FbpSjYQddUQnSYRkxb3E42SH+gBskrRUrxlf2CYvQo=;
 b=R29k5K9SgP9/7YwRiM0/WPCKRfkJzS5ETUNTh40s/ioZ0qLMlB2DIlrbbuB+7/hAe/
 ZUo+HxFxGWciKMVkEO18NlcT+NQZIFL+ffNg2vFiwq9vgKXJqr6nToKBmfcxTc9IRmbj
 fTGWk3+rVM3CXpsggRAJJgZSbfXKtJ0rOBHcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684338222; x=1686930222;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9FbpSjYQddUQnSYRkxb3E42SH+gBskrRUrxlf2CYvQo=;
 b=io0ijW7pjg665cYM5Jz6uuvSuA2rhRo4lzre3bIG/aVkchK1JTaOXP/GZQPtlXVlLT
 mRlfWuhTZ1efiAUyEsC4qvYnpyuQ+N8HUFOYQSwc5o33AlacT5FKoi/lTdPH/pcFcLYw
 VlcdNQpSALY6e0VC0epvd95R0MZQ5xlUno436Vdk2m99y+x7MNjwOBb/v0GyB3de9ydl
 bvweoZK9GP53HXZrqzVsKytT0FqnpvlAQdp6Q5xm4m4zix5B6UreiomM1VaTR4n8wfdN
 nQCBBHK9gV5A+4/iyYNNYeo/ivv0OKLZEeYTgHWTYUt33vT6mu08hsQQ6r9qAgYMIqJw
 pPrw==
X-Gm-Message-State: AC+VfDwmlZP/t5IZoe1ScqQEjWHFst0W1W/zq2RC4bb7Hsa01+QRjVuP
 I8aSHDrwt9OLxAEAA/tBEorvWMSZmqq9/CwWwf8=
X-Google-Smtp-Source: ACHHUZ5NbJSNBcNnRTnA6S+ia0upSI5z4a81xuxvFa4hOcbLXv+6XSXjY56mzfcDPNWxDiwG4mKXIQ==
X-Received: by 2002:a05:622a:288:b0:3f5:2450:df1b with SMTP id
 z8-20020a05622a028800b003f52450df1bmr240210qtw.17.1684338222338; 
 Wed, 17 May 2023 08:43:42 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 x14-20020a05620a14ae00b007579ea33cdesm696622qkj.62.2023.05.17.08.43.41
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 08:43:41 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-3f51ea3a062so167911cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 17 May 2023 08:43:41 -0700 (PDT)
X-Received: by 2002:a05:622a:34a:b0:3f3:75c2:7466 with SMTP id
 r10-20020a05622a034a00b003f375c27466mr405967qtw.8.1684338221234; Wed, 17 May
 2023 08:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230517125423.930967-1-arnd@kernel.org>
In-Reply-To: <20230517125423.930967-1-arnd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 May 2023 08:43:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V9+urs=+xJS5=bMSsrF5_8XwHaG3YT2BjC=nUQiBnqag@mail.gmail.com>
Message-ID: <CAD=FV=V9+urs=+xJS5=bMSsrF5_8XwHaG3YT2BjC=nUQiBnqag@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, May 17, 2023 at 5:54 AM Arnd Bergmann <arnd@kernel.org>
    wrote: > > From: Arnd Bergmann <arnd@arndb.de> > > kdb_send_sig() is defined
    in the signal code and called from kdb, > but the declara [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.160.180 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.180 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pzJJc-00BFPb-NU
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: include header in signal handling
 code
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
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIE1heSAxNywgMjAyMyBhdCA1OjU04oCvQU0gQXJuZCBCZXJnbWFubiA8YXJu
ZEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+Cj4KPiBrZGJfc2VuZF9zaWcoKSBpcyBkZWZpbmVkIGluIHRoZSBzaWduYWwgY29kZSBhbmQg
Y2FsbGVkIGZyb20ga2RiLAo+IGJ1dCB0aGUgZGVjbGFyYXRpb24gaXMgcGFydCBvZiB0aGUga2Ri
IGludGVybmFsIGNvZGUuCj4gSW5jbHVkZSB0aGlzIGZyb20gc2lnbmFsLmMgYXMgd2VsbCB0byBh
dm9pZCB0aGUgd2FybmluZzoKPgo+IGtlcm5lbC9zaWduYWwuYzo0Nzg5OjY6IGVycm9yOiBubyBw
cmV2aW91cyBwcm90b3R5cGUgZm9yICdrZGJfc2VuZF9zaWcnIFstV2Vycm9yPW1pc3NpbmctcHJv
dG90eXBlc10KPgo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
Cj4gLS0tCj4gIGtlcm5lbC9zaWduYWwuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQoKUmV2aWV3ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9t
aXVtLm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tn
ZGItYnVncmVwb3J0Cg==
