Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 018CC6AE6E7
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  7 Mar 2023 17:41:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pZaNU-0002Iv-La
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 07 Mar 2023 16:41:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pZaNT-0002Ip-3m
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 07 Mar 2023 16:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3nhxUdlMqxNbyOW/Z24Evrx37DDz/B6TitMQXvC2VtM=; b=l4GDdWNC+VZ9LffDhGBnSiPT/r
 F6VVjQEKtXDymggCSTYWUeNcXoDEsprZCw5RljqlYD9eaCRm0EpIeO2vSoMT59ML8mbjgqBHVNICj
 otn/NharlxeJPUByi1sfHAkRjWIO+xRX1X6DnJa9Zi8Qxz25xc1mesZk6TuFb6zj8XSI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3nhxUdlMqxNbyOW/Z24Evrx37DDz/B6TitMQXvC2VtM=; b=bRIy0qbLQSKaCqJ3d7iRs+CZw1
 R1dQFEF8+iKoxyN5bfAudRTbXvejbxlgG5q8KqbzGJoRGciu9azLlCO/TMp+AcFr2ZCazKNGvU8PR
 PrfnTw/nJyni7gVb4W/tcXKVdi8WEWRQp0hZCzOmXsb7Ubs8LZnuPh0nQfzfq49G1nlA=;
Received: from mail-yw1-f180.google.com ([209.85.128.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pZaNS-002MZp-2u for kgdb-bugreport@lists.sourceforge.net;
 Tue, 07 Mar 2023 16:41:27 +0000
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-536b7ffdd34so254840107b3.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 07 Mar 2023 08:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678207280;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3nhxUdlMqxNbyOW/Z24Evrx37DDz/B6TitMQXvC2VtM=;
 b=OFRxRj2lcLO09wD5FCNN+3+D1FTPl/0lDBjxlPRMFx8IAAMBzSfg4m/P0ZEO5e5Nzu
 qU5gl+PoUnkmSQwZhcHpeb166i41ztU3oKLQVE253GS1hNVtPWmWg5Fu+95I+gAISnDM
 XB3UMoi1Roc/h7ozO2OKBlhAKpGpq1h+R+Ta0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678207280;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3nhxUdlMqxNbyOW/Z24Evrx37DDz/B6TitMQXvC2VtM=;
 b=GewlCqBpe3g364AC3BSyJat9HeP/4k+0s6HieOUO3yYs1LFJY858zoUjChlp2SD4TH
 8Z7qwq3cFDo1+xvNmKzsPd7XlfkbzsH8TcfWMBLi4wW18rV0yaQJpeT4BPY9qOAOjZ21
 rkkrgLobgjyTvDwBSEjJhRB3Drz81eIYHo35Tzg3kj+wFqeLPna3GcsCQHUrbqr7cAy/
 ST/Le91wOi3spuP5fMgxGDOJXuYmOK0lnPF9E8UHqC0hncdfs21ZEFNlKyZEb82tVVrW
 HrjqJhP6Y/gla/hJVHxwCbWmP4Nsf3w8pUhAjYf16XyPqKzN59tCgZNcTff+d4OqA0zu
 tLuQ==
X-Gm-Message-State: AO0yUKXGXC4VKQTuo7Zaia+wjJlrw9KVbuiqzQgkvw88AKsxwRkex3NZ
 PC0VW510oThvxNiDtcPiuoSZp9MRSHRGnVb78Fg=
X-Google-Smtp-Source: AK7set9Cc20bpcjD3GWrTiddWFZa3zbhK92x3aYVe2g4oNqPlm2VPLAI1BOdCM8iF9NZNfoHwjuJ6Q==
X-Received: by 2002:a92:cd81:0:b0:317:6591:95fe with SMTP id
 r1-20020a92cd81000000b00317659195femr12978519ilb.28.1678206861969; 
 Tue, 07 Mar 2023 08:34:21 -0800 (PST)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com.
 [209.85.166.54]) by smtp.gmail.com with ESMTPSA id
 s12-20020a02ad0c000000b003a53692d6dbsm4272413jan.124.2023.03.07.08.34.20
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:34:21 -0800 (PST)
Received: by mail-io1-f54.google.com with SMTP id b5so5651735iow.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 07 Mar 2023 08:34:20 -0800 (PST)
X-Received: by 2002:a02:7310:0:b0:3e0:6875:f5e2 with SMTP id
 y16-20020a027310000000b003e06875f5e2mr7264173jab.6.1678206860373; Tue, 07 Mar
 2023 08:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20230302195618.156940-1-john.ogness@linutronix.de>
 <20230302195618.156940-2-john.ogness@linutronix.de>
In-Reply-To: <20230302195618.156940-2-john.ogness@linutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Mar 2023 08:34:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V1akD6NpV=XePGRiyKs0z-esjMYpBkE4-TZfq__x2m_w@mail.gmail.com>
Message-ID: <CAD=FV=V1akD6NpV=XePGRiyKs0z-esjMYpBkE4-TZfq__x2m_w@mail.gmail.com>
To: John Ogness <john.ogness@linutronix.de>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Thu, Mar 2, 2023 at 11:57 AM John Ogness <john.ogness@linutronix.de>
    wrote: > > It is allowed for consoles to provide no write() callback. For
    > example ttynull does this. > > Check if a write() [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.180 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.180 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pZaNS-002MZp-2u
Subject: Re: [Kgdb-bugreport] [PATCH printk v1 01/18] kdb: do not assume
 write() callback available
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, Aaron Tomlin <atomlin@redhat.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUaHUsIE1hciAyLCAyMDIzIGF0IDExOjU34oCvQU0gSm9obiBPZ25lc3MgPGpvaG4u
b2duZXNzQGxpbnV0cm9uaXguZGU+IHdyb3RlOgo+Cj4gSXQgaXMgYWxsb3dlZCBmb3IgY29uc29s
ZXMgdG8gcHJvdmlkZSBubyB3cml0ZSgpIGNhbGxiYWNrLiBGb3IKPiBleGFtcGxlIHR0eW51bGwg
ZG9lcyB0aGlzLgo+Cj4gQ2hlY2sgaWYgYSB3cml0ZSgpIGNhbGxiYWNrIGlzIGF2YWlsYWJsZSBi
ZWZvcmUgdXNpbmcgaXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKb2huIE9nbmVzcyA8am9obi5vZ25l
c3NAbGludXRyb25peC5kZT4KPiAtLS0KPiAga2VybmVsL2RlYnVnL2tkYi9rZGJfaW8uYyB8IDIg
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2tl
cm5lbC9kZWJ1Zy9rZGIva2RiX2lvLmMgYi9rZXJuZWwvZGVidWcva2RiL2tkYl9pby5jCj4gaW5k
ZXggNWM3ZTliYTdjZDZiLi5lOTEzOWRmYzFmMGEgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2RlYnVn
L2tkYi9rZGJfaW8uYwo+ICsrKyBiL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX2lvLmMKPiBAQCAtNTc2
LDYgKzU3Niw4IEBAIHN0YXRpYyB2b2lkIGtkYl9tc2dfd3JpdGUoY29uc3QgY2hhciAqbXNnLCBp
bnQgbXNnX2xlbikKPiAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAgICAgICAg
ICAgICAgICAgaWYgKGMgPT0gZGJnX2lvX29wcy0+Y29ucykKPiAgICAgICAgICAgICAgICAgICAg
ICAgICBjb250aW51ZTsKPiArICAgICAgICAgICAgICAgaWYgKCFjLT53cml0ZSkKPiArICAgICAg
ICAgICAgICAgICAgICAgICBjb250aW51ZTsKClJldmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVyc29u
IDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVw
b3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
