Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B27DAAD89D6
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 13 Jun 2025 12:53:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hra0IWE9U3XbZucqD6/fdaRYdk4bsugC8Zg88IwiYcI=; b=Yv3ZhqnaWWg4LOMk3J9HZnJhVE
	awS20W65cnXqIT6VTL9f28UQeI+igKcU7kpjE7+plTXRtaZdCoAG3IduXghkZX8I0e+1cq42CoOJA
	WAtYatxWtj9vvorQ2jsh3ZXJkL5/eDeWfCgwuh2VOzfpWsj4IwKD/VS9w8hkHYDkcxxE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uQ220-00006u-JH
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 13 Jun 2025 10:53:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uQ21z-00006n-DF
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Jun 2025 10:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DgWvQag2QGzdzZH71/CBz+H5MGX3oMtaddibtY3jjg8=; b=Roptc0iNnYW0q1EDxGX1R8JVmu
 BM8G48fF6g1/pCVSqOUJMtKUI9EG89JNRNh7hWUuywmMEX4KG7TNRb1iwVchKZsu7clgMk2/0qAYh
 qWAQNKRF+a9ru0h4Oq50o42a6JndjB5U0eq7l+fFxuFhEjS1Y/v81s9EfXxIwdtya1iw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DgWvQag2QGzdzZH71/CBz+H5MGX3oMtaddibtY3jjg8=; b=lUze+uKbPO7xwCtelVbV6HYk0T
 LcR8aHIVjb2hCIm+Jtcam0VOr16S7RQjeIvJOZOJSZ1Cgh7vgEUJlisBXJrr5b2GP3wmOWvQs1W7Z
 77Nm5CsrxFAGarQoLpq35Jx7PUs/Wai6VjEBmnt5L0FBlmwAAdsD4nFEwTVeoar/TDGM=;
Received: from mail-wm1-f48.google.com ([209.85.128.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uQ21y-0004zY-Rl for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Jun 2025 10:53:07 +0000
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-453066fad06so15085915e9.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 13 Jun 2025 03:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1749811975; x=1750416775; darn=lists.sourceforge.net; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DgWvQag2QGzdzZH71/CBz+H5MGX3oMtaddibtY3jjg8=;
 b=YkgBY01vKUJvaIihhlAaQdRCZA+jxFpUgGXdaX5jVBvCcA9y0XyxjiBGYlFR1IV/cI
 frQCEbbvm3dUmbQmGU8AZ+Dl1zBleyTBHGugPVaIERqB/SXoqGzxkoHGOXirlJTVxs75
 N8KE1UE/CHx89GzVphLBwh7cVP/ZxKfzLutPA4P2VCKEdTLTBJxSK32YBypLhE7Yk2fh
 qXNrAWqe16aNvHeMvIzV6lBkd8jALJF7THs7C35XcOlvPTzNe/idBlVP0n+Av6htwurT
 I5kKBXpDF09qb97hj/KchfY7FzJZ7MRzHfWnTnE3bUCypWhnjAnjtgslucQmPmhheGD/
 LZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749811975; x=1750416775;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DgWvQag2QGzdzZH71/CBz+H5MGX3oMtaddibtY3jjg8=;
 b=Wzmt4KzkuJ2xk3OXdYXjaHDM3zWrcIaSkl8w9p98hR9lXBhyY4kDO9+7gsgZOd25TH
 uLEjEdwi7NUzVqfbfYHA3XIzS/NorgiuqGLQwi31eXwoKxaSy2sgzHsa+T45tsKpDfji
 fRS5zURr8iClbc5iVMfwmIGd3qX51248U/G9OMfXWfn+zXp5y0ozCmUzqksHxJE2uSDk
 eLEfMdcQ0Sm5vrSR7a8sqPcJZVmito/yYStTezeM3CRJY4dlHAAOj2AyPgS7UlLuUNtb
 AIm8Cr2mBAnG9pZ6OvRvxLPDMqOVu1sLPHeRisXufZkYG4PwWg16vox12nhnNW4Fl2e1
 9R3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz5Td5wXPf7jdaC3SaYXBJQGQi3tzfAVcWiUr1YkTa4TjbYi7AAErsycT/K6HlVe3uSGotiEzobTPOhVwI9w==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxXfOUNapLxJveLTj8QFn9wuEaf5Hqu1343ZqcUw5bPL/MXh6ta
 teFfHotkzIjclLTnN82KFoFjndG1VgDoplI3jdCiJxsrwZDE/X0CQdwW0suzHNY5mvSrNcOFQyx
 m2yw0
X-Gm-Gg: ASbGncuJZNtN7nvdlouk5PKB10Tqf+1q5sUVqIdCiHmeP8CHFWM0RtXTb5Nl58/S16Z
 mEVwxxgVOJ61V3c7vEaO/Y9lgW2LHlH1zujfTMtCuk+P/F/45bjwY9XljoZlW/le3TsRzVxo4tJ
 uLLJee4vW63HANvab3ESUD2m3rJECRnY0C6yZFsY6RFxBU0lWoI6vVUN7uYzbBQW1wcjoM8DAiy
 wvumgKFyhv0l48KxcQHWBbAm3xeQWYKgkIG4TKiGlvTb11n4tJWK4Jvao//xBA3fmeOt7sLXuiZ
 2n/XYvsWMC6875Ms1oX8FO1winBgzwMYt+TsYIiTIhZc65ieIzYaQrEFZDeTP2m0
X-Google-Smtp-Source: AGHT+IHJOeLrZP5NvvZh4tWyIjAn3K7bzr2Vcb2r/+QXO+h/w0YFHvsR1/KLQStT6Bew+1GfqtSw2g==
X-Received: by 2002:a05:6000:2582:b0:3a4:f722:f00b with SMTP id
 ffacd0b85a97d-3a5686e4287mr1798399f8f.11.1749811975195; 
 Fri, 13 Jun 2025 03:52:55 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748900060c5sm1273973b3a.45.2025.06.13.03.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 03:52:54 -0700 (PDT)
Date: Fri, 13 Jun 2025 12:52:35 +0200
To: Doug Anderson <dianders@chromium.org>
Message-ID: <aEwC81RhvveGP73Y@pathway.suse.cz>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-4-f427c743dda0@suse.com>
 <CAD=FV=XXQyZLYKoszj68ZGFDY=9-cmEUp406WeOeSBVZOHyUHw@mail.gmail.com>
 <f962e9bab3dc8bf5cae1c7e187a54fb96a543d51.camel@suse.com>
 <CAD=FV=XFeokpbMUFjAc0OkwJ97vR8aB+4GbnFxRKymvpEY3gnA@mail.gmail.com>
 <aErcrCKcsi9cpANY@pathway.suse.cz>
 <CAD=FV=WFWviPPR6VWmsN2-+vzRDoU6oTNH=EP6z1usG4EDR3+w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=WFWviPPR6VWmsN2-+vzRDoU6oTNH=EP6z1usG4EDR3+w@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 2025-06-12 16:16:09, Doug Anderson wrote: > Hi, > >
 On Thu, Jun 12, 2025 at 6:57 AM Petr Mladek <pmladek@suse.com> wrote: > >
 > > > > > > @@ -577,7 +577,8 @@ static int __init kgdboc_earlycon_i [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.48 listed in wl.mailspike.net]
X-Headers-End: 1uQ21y-0004zY-Rl
Subject: Re: [Kgdb-bugreport] [PATCH 4/7] drivers: serial: kgdboc: Check
 CON_SUSPENDED instead of CON_ENABLED
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Richard Weinberger <richard@nod.at>,
 John Ogness <john.ogness@linutronix.de>,
 Marcos Paulo de Souza <mpdesouza@suse.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Johannes Berg <johannes@sipsolutions.net>, Jiri Slaby <jirislaby@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gVGh1IDIwMjUtMDYtMTIgMTY6MTY6MDksIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gSGksCj4g
Cj4gT24gVGh1LCBKdW4gMTIsIDIwMjUgYXQgNjo1N+KAr0FNIFBldHIgTWxhZGVrIDxwbWxhZGVr
QHN1c2UuY29tPiB3cm90ZToKPiA+Cj4gPiA+ID4gPiA+IEBAIC01NzcsNyArNTc3LDggQEAgc3Rh
dGljIGludCBfX2luaXQga2dkYm9jX2Vhcmx5Y29uX2luaXQoY2hhcgo+ID4gPiA+ID4gPiAqb3B0
KQo+ID4gPiA+ID4gPiAgICAgICAgIGNvbnNvbGVfbGlzdF9sb2NrKCk7Cj4gPiA+ID4gPiA+ICAg
ICAgICAgZm9yX2VhY2hfY29uc29sZShjb24pIHsKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAg
IGlmIChjb24tPndyaXRlICYmIGNvbi0+cmVhZCAmJgo+ID4gPiA+ID4gPiAtICAgICAgICAgICAg
ICAgICAgIChjb24tPmZsYWdzICYgKENPTl9CT09UIHwgQ09OX0VOQUJMRUQpKSAmJgo+ID4gPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgIChjb24tPmZsYWdzICYgQ09OX0JPT1QpICYmCj4gPiA+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgKChjb24tPmZsYWdzICYgQ09OX1NVU1BFTkRFRCkg
PT0gMCkgJiYKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIGhhdmVuJ3QgdHJpZWQgcnVubmluZyB0aGUg
Y29kZSwgc28gSSBjb3VsZCBlYXNpbHkgYmUgbWlzdGFrZW4sCj4gPiA+ID4gPiBidXQuLi4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiAuLi50aGUgYWJvdmUgZG9lc24ndCBzZWVtIGxpa2UgdGhlIGNvcnJl
Y3QgY29udmVyc2lvbi4gVGhlIG9sZAo+ID4gPiA+ID4gZXhwcmVzc2lvbiB3YXM6Cj4gPiA+ID4g
Pgo+ID4gPiA+ID4gKGNvbi0+ZmxhZ3MgJiAoQ09OX0JPT1QgfCBDT05fRU5BQkxFRCkpCj4gPiA+
ID4gPgo+ID4gSXQgaXMgZWFzeSB0byBnZXQgY29uZnVzZWQgYnkgdGhlIHJlZ2lzdGVyX2NvbnNv
bGUoKSBjb2RlLiBBbmQKPiA+IGl0IGhhcyBiZWVuIGV2ZW4gd29yc2Ugc29tZSB5ZWFycyBhZ28u
Cj4gPgo+ID4gQW55d2F5LCB0aGUgY3VycmVudCBjb2RlIHNldHMgQ09OX0VOQUJMRUQgZm9yIGFs
bCByZWdpc3RlcmVkCj4gPiBjb25zb2xlcywgaW5jbHVkaW5nIENPTl9CT09UIGNvbnNvbGVzLiBU
aGUgZmxhZyBpcyBjbGVhcmVkIG9ubHkKPiA+IGJ5IGNvbnNvbGVfc3VzcGVuZCgpWypdIG9yIHVu
cmVnaXN0ZXJfY29uc29sZSgpLgo+ID4KPiA+IElNSE8sIGtnZGJvY19lYXJseWNvbl9pbml0KCkg
ZG9lcyBub3QgbmVlZCB0byBjYXJlIGFib3V0Cj4gPiBjb25zb2xlX3N1c3BlbmQoKSBiZWNhdXNl
IHRoZSBrZXJuZWwgY291bGQgbm90IGJlIHN1c3BlbmRlZAo+ID4gZHVyaW5nIGJvb3QuIERvZXMg
dGhpcyBtYWtlcyBzZW5zZT8KPiAKPiBZZWFoLCBtYWtlcyBzZW5zZSB0byBtZS4KPiAKPiA+IFJl
c3VtZToKPiA+Cj4gPiBJIHdvdWxkIHJlbW92ZSB0aGUgY2hlY2sgb2YgQ09OX0VOQUJMRUQgb3Ig
Q09OX1NVU1BFTkRFRAo+ID4gZnJvbSBrZ2Rib2NfZWFybHljb25faW5pdCgpIGNvbXBsZXRlbHku
Cj4gPgo+ID4gSU1ITywgd2Ugc2hvdWxkIGtlZXAgdGhlIGNoZWNrIG9mIENPTl9CT09UIGJlY2F1
c2Ugd2UgZG8gbm90Cj4gPiB3YW50IHRvIHJlZ2lzdGVyICJub3JtYWwiIGNvbnNvbGUgZHJpdmVy
cyBhcyBrZ2Rib2NfZWFybHljb25faW9fb3BzLgo+ID4gSXQgaXMgbGF0ZXIgcmVtb3ZlZCBieSBr
Z2Rib2NfZWFybHljb25fZGVpbml0KCkuIEkgZ3Vlc3MKPiA+IHRoYXQgdGhlIGNvZGUgaXMgbm90
IHJlYWR5IHRvIGhhbmRsZSBhIHRha2VvdmVyIGZyb20gbm9ybWFsCj4gPiB0byBub3JtYWwgKGV2
ZW4gdGhlIHNhbWUpIGNvbnNvbGUgZHJpdmVyLgo+IAo+IEknbSBub3Qgc3VyZSBJIHVuZGVyc3Rh
bmQgeW91ciBsYXN0IHNlbnRlbmNlIHRoZXJlLiBJbiBnZW5lcmFsIHRoZQo+IGNvZGUgaGFuZGxp
bmcgYWxsIG9mIHRoZSBwb3NzaWJsZSBoYW5kb2ZmIChvciBsYWNrIG9mIGhhbmRvZmYpIGNhc2Vz
Cj4gYmV0d2VlbiBrZ2Rib2NfZWFybHljb24gYW5kIHJlZ3VsYXIga2dkYm9jIGlzIHByZXR0eSB3
YWNreS4gQXQgb25lCj4gcG9pbnQgSSB0aG91Z2h0IHRocm91Z2ggaXQgYWxsIGFuZCB0cmllZCB0
byB0ZXN0IGFzIG1hbnkgc2NlbmFyaW9zIGFzCj4gSSBjb3VsZCBhbmQgSSBzZWVtIHRvIHJlbWVt
YmVyIHRyeWluZyB0byBtb2RlbCBzb21lIG9mIHRoZSBiZWhhdmlvciBvbgo+IGhvdyBlYXJseWNv
biB3b3JrZWQuIElmIHNvbWV0aGluZyBsb29rcyBicm9rZW4gaGVyZSB0aGVuIGxldCBtZSBrbm93
LgoKTGF0ZXIgdXBkYXRlOiBUaGUgY29kZSBpcyBzYWZlLiBUaGUgc2NlbmFyaW8gYmVsb3cgZG9l
cyBub3QgZXhpc3QsCgkgICAgICBzZWUgdGhlICJXQUlUOiIgc2VjdGlvbiBiZWxvdy4KCgpJIGFt
IG5vdCBmYW1pbGlhciB3aXRoIHRoZSBrZ2RiIGluaXQgY29kZS4gSSB0aG91Z2h0IGFib3V0IHRo
ZQpmb2xsb3dpbmcgc2NlbmFyaW86CgoxLiBrZ2Rib2NfZWFybHljb25faW5pdCgpIHJlZ2lzdGVy
cyBzb21lIHN0cnVjdCBjb25zb2xlIHZpYQoKCWtnZGJvY19lYXJseWNvbl9pb19vcHMuY29ucyA9
IGNvbjsKCXByX2luZm8oIkdvaW5nIHRvIHJlZ2lzdGVyIGtnZGIgd2l0aCBlYXJseWNvbiAnJXMn
XG4iLCBjb24tPm5hbWUpOwoJaWYgKGtnZGJfcmVnaXN0ZXJfaW9fbW9kdWxlKCZrZ2Rib2NfZWFy
bHljb25faW9fb3BzKSAhPSAwKSB7CgogICBhbmQgc2V0cwoKCQllYXJseWNvbl9vcmlnX2V4aXQg
PSBjb24tPmV4aXQ7CgkJY29uLT5leGl0ID0ga2dkYm9jX2Vhcmx5Y29uX2RlZmVycmVkX2V4aXQ7
CgoKMi4gTGF0ZXIsIGNvbmZpZ3VyZV9rZ2Rib2MoKSB3b3VsZCBmaW5kIHNvbWUgInByZWZlcnJl
ZCIgY29uc29sZQogICBhbmQgcmVnaXN0ZXIgaXQgdmlhCgoJZm9yX2VhY2hfY29uc29sZV9zcmN1
KGNvbnMpIHsKCQlpbnQgaWR4OwoJCWlmIChjb25zLT5kZXZpY2UgJiYgY29ucy0+ZGV2aWNlKGNv
bnMsICZpZHgpID09IHAgJiYKCQkgICAgaWR4ID09IHR0eV9saW5lKSB7CgkJCWtnZGJvY19pb19v
cHMuY29ucyA9IGNvbnM7ClsuLi5dCgllcnIgPSBrZ2RiX3JlZ2lzdGVyX2lvX21vZHVsZSgma2dk
Ym9jX2lvX29wcyk7CgogICAsIHdoZXJlIGtnZGJfcmVnaXN0ZXJfaW9fbW9kdWxlIHdvdWxkIGNh
bGwgZGVpbml0IGZvciB0aGUKICAgcHJldmlvdXNseSByZWdpc3RlcmVkIGtnZGJvY19lYXJseWNv
bl9pb19vcHM6CgoJaWYgKG9sZF9kYmdfaW9fb3BzKSB7CgkJb2xkX2RiZ19pb19vcHMtPmRlaW5p
dCgpOwoJCXJldHVybiAwOwoJfQoKICAgLCB3aGVyZSBrZ2Rib2NfZWFybHljb25fZGVpbml0KCkg
bWlnaHQgY2FsbCB0aGUgLmV4aXQoKSBjYWxsYmFjawoKCQlrZ2Rib2NfZWFybHljb25faW9fb3Bz
LmNvbnMtPmV4aXQoa2dkYm9jX2Vhcmx5Y29uX2lvX29wcy5jb25zKTsKCgpCQU5HOiBJZiBib3Ro
ICJrZ2Rib2NfZWFybHljb25faW9fb3BzIiBhbmQgImtnZGJvY19pb19vcHMiIHBvaW50ZWQgdG8K
ICAgICAgdGhlIHNhbWUgc3RydWN0IGNvbnNvbGUgdGhlbiB0aGlzIG1pZ2h0IGNhbGwgLmV4aXQo
KSBjYWxsYmFjawogICAgICBmb3IgYSBjb25zb2xlIHdoaWNoIGlzIHN0aWxsIGJlaW5nIHVzZWQu
CgogICAgICBCdXQgSSBhbSB3cm9uZywgc2VlIGJlbG93LgoKV0FJVDoKCkkgaGF2ZSBnb3QgYWxs
IHRoZSBwaWVjZXMgdG9nZXRoZXIgd2hlbiB3cml0aW5nIHRoaXMgbWFpbCkuCkkgc2VlIHRoYXQg
dGhlIGNvZGUgaXMgc2FmZSwgbmFtZWx5OgoKc3RhdGljIHZvaWQga2dkYm9jX2Vhcmx5Y29uX2Rl
aW5pdCh2b2lkKQp7CglpZiAoIWtnZGJvY19lYXJseWNvbl9pb19vcHMuY29ucykKCQlyZXR1cm47
CgoJaWYgKGtnZGJvY19lYXJseWNvbl9pb19vcHMuY29ucy0+ZXhpdCA9PSBrZ2Rib2NfZWFybHlj
b25fZGVmZXJyZWRfZXhpdCkKCQkvKgoJCSAqIGtnZGJvY19lYXJseWNvbiBpcyBleGl0aW5nIGJ1
dCBvcmlnaW5hbCBib290IGNvbnNvbGUgZXhpdAoJCSAqIHdhcyBuZXZlciBjYWxsZWQgKEFLQSBr
Z2Rib2NfZWFybHljb25fZGVmZXJyZWRfZXhpdCgpCgkJICogZGlkbid0IGV2ZXIgcnVuKS4gIFVu
ZG8gb3VyIHRyYXAuCgkJICovCgkJa2dkYm9jX2Vhcmx5Y29uX2lvX29wcy5jb25zLT5leGl0ID0g
ZWFybHljb25fb3JpZ19leGl0OwoJZWxzZSBpZiAoa2dkYm9jX2Vhcmx5Y29uX2lvX29wcy5jb25z
LT5leGl0KQoJCS8qCgkJICogV2Ugc2tpcHBlZCBjYWxsaW5nIHRoZSBleGl0KCkgcm91dGluZSBz
byB3ZSBjb3VsZCB0cnkgdG8KCQkgKiBrZWVwIHVzaW5nIHRoZSBib290IGNvbnNvbGUgZXZlbiBh
ZnRlciBpdCB3ZW50IGF3YXkuICBXZSdyZQoJCSAqIGZpbmFsbHkgZG9uZSBzbyBjYWxsIHRoZSBm
dW5jdGlvbiBub3cuCgkJICovCgkJa2dkYm9jX2Vhcmx5Y29uX2lvX29wcy5jb25zLT5leGl0KGtn
ZGJvY19lYXJseWNvbl9pb19vcHMuY29ucyk7CgoJa2dkYm9jX2Vhcmx5Y29uX2lvX29wcy5jb25z
ID0gTlVMTDsKfQoKSXQgY2FsbHMga2dkYm9jX2Vhcmx5Y29uX2lvX29wcy5jb25zLT5leGl0KCkg
b25seSB3aGVuCnVucmVnaXN0ZXJfY29uc29sZSgpIHRyaWVkIHRvIGNhbGwgdGhlIG9yaWdpbmFs
IGNvbi0+ZXhpdCgpCndoaWNoIHdhcyByZWFzc2lnbmVkIHRvIGtnZGJvY19lYXJseWNvbl9kZWZl
cnJlZF9leGl0KCkuLi4KClVwZGF0ZWQgcmVzdW1lOgoKSXQgbG9va3MgdG8gbWUgdGhhdCBldmVu
IG5vcm1hbCBjb25zb2xlIGNhbiBiZSB1c2VkIGJ5CmtnZGJvY19lYXJseWNvbl9pb19vcHMgYW5k
IHdlIGNvdWxkIHJlbW92ZSBldmVuIHRoZSBjaGVjawpvZiB0aGUgQ09OX0JPT1QgZmxhZy4KCk15
IGV4cGVjdGF0aW9uOgoKSWYgYSAic3RydWN0IGNvbnNvbGUiIGlzIHJlZ2lzdGVyZWQgdGhlbiB0
aGUgZHJpdmVyIGlzIHVzZWQKYnkgcHJpbnRrKCkgYW5kIGl0IHNob3VsZCBiZSBzYWZlIGV2ZW4g
Zm9yIGtnZGJvY19lYXJseWNvbiwKYXMgbG9uZyBhcyBpdCBoYXMgYm90aCAiY29uLT53cml0ZSIg
YW5kICJjb24tPnJlYWQiIGNhbGxiYWNrcy4KClNvIHRoZSBjaGVjayBpbiBrZ2Rib2NfZWFybHlj
b25faW5pdCgpIG1pZ2h0IGJlOgoKCWZvcl9lYWNoX2NvbnNvbGUoY29uKSB7CgkJaWYgKGNvbi0+
d3JpdGUgJiYgY29uLT5yZWFkICYmCgkJICAgICghb3B0IHx8ICFvcHRbMF0gfHwgc3RyY21wKGNv
bi0+bmFtZSwgb3B0KSA9PSAwKSkKCQkJYnJlYWs7Cgl9CgpIZWgsIEkgaG9wZSB0aGF0IHlvdSB3
ZXJlIGFibGUgdG8gZm9sbG93IG15IHRob3VnaHRzIGFuZCBJIGRpZCBub3QKY3JlYXRlIGV2ZW4g
YmlnZ2VyIGNvbmZ1c2lvbi4KCkJlc3QgUmVnYXJkcywKUGV0cgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlz
dApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
