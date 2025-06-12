Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E6BAD7F14
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 13 Jun 2025 01:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRGYSPoJaOw377gJdTTXW8CUD42RGbfRTVxp81zvR7I=; b=UrD0IV58A3L23S/gZin+K3YEsQ
	vFcpEX9UDLkjttWWlKzR1D5aXmM8Fwo1tyuz1GJHJ8L61QzErAoTEUauk2aL55tDAjIQ6STaAe6+s
	xvMOKyYRSi9O/zD3Qg9AU1kquP31Vcih8wn7KZgX39hBCgi1SyZY/BPWzRewo1NDhlbc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uPrZu-0001N4-Iy
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 12 Jun 2025 23:43:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1uPrZt-0001Mx-2y
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 12 Jun 2025 23:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VX2tp7vE9Xc39hTYGYaV6T2gV76j7v4yp4p4MnAvSyU=; b=FxtfBOj4ylDNKcSOBH1LE6dKml
 bihw+eVUl19NAjOTiwQ0scg11Ne98pnZtGg/rSYSpwi7xH3L2wXnNm2MCdhh8cZbm5Qjb0t8gv8c5
 9nW8BAg08b1NZ3YLVZJVFEqaUWB8Hr2vCCg8fSRhBuWZBp5fD6A7oc+Zan7U/9mvgZiA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VX2tp7vE9Xc39hTYGYaV6T2gV76j7v4yp4p4MnAvSyU=; b=eaiR3XEBr4EI1gZf9Y4ubF8uKm
 ceVWraFQCnwNs84TNAZs4Nh1iwtWuHgwLAG/JndwdPNn8cwLb4cjnq0DpIVTo5Qpb3tRyZpYdpa7T
 L6ygu+xcWt/uoWsKLLmhyb8CgoDYczP6LxDQfZj//cqp44mfNJPL8HjRWvNbNcWG68i4=;
Received: from mail-qv1-f54.google.com ([209.85.219.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uPrZs-0005C1-J6 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 12 Jun 2025 23:43:25 +0000
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6fb3bba0730so9249566d6.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 12 Jun 2025 16:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749771793; x=1750376593;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VX2tp7vE9Xc39hTYGYaV6T2gV76j7v4yp4p4MnAvSyU=;
 b=LWq/STOoA8uiYCFWWMc2T3Vy3OIVbHc/cmqcx3sb0oWjoynQTSrtMKOfEFIlA8+WR0
 op8GidLdCZIHF2Z+kTs6kgYMpX5XAffHfHyRorh0qfhfumsPPV5SQKNpPKURgf5yDlk5
 BzPhTe1H1ckh0aXsJYVBFlyjPKvB68gX+d1zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749771793; x=1750376593;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VX2tp7vE9Xc39hTYGYaV6T2gV76j7v4yp4p4MnAvSyU=;
 b=mEUxbJ4B2PiATs38t/xyh/hAWEWzrn+kAyanwXEWU5IouBsJKjfSpxPRFP4ZfElNUN
 +05s9W5R1aFSCVmlbWvMoM6L6iJJY15sFCQaYg57l9PlLwZrY0+G8rjZoEp2BltEdpzu
 DnFaoIlVTBqWyUdk9ep5dFykltwwVGmSIwSftLPkOvZuyecOdsg8ZjrQpPVakp2HMQaT
 KqAkREEb+n8kqSi/U5r0vPNsdVAiPzjQYmmPpifEuTmVKV5GSApeWUttezxet+xnIgmv
 EdyK58yOVWWbILRgDKGk65HecdiajLNUVyfwy0h98NAgFvPQd5Nop4SzQ4qniG+jjzU7
 uj+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ0vUSY/Wj1uboRRQLRii1mEbSeZKFGO+7YEuoeQoCCgalDG7C2+16E2YM5O7tNGHMwefKUgs6Oklu41zhfw==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxhFAVYZU+xpqfrXF8lSI8MjbfBIsu1Ux0G1yrmPm2EaulDc/bC
 G4uyecnRMPVLyFqNq1MCtZZt8RIxxqfznfw+ZD/CKjrP/Ga39xK4RK8wl/otud/YmsFBM8Crj/q
 XMbE=
X-Gm-Gg: ASbGnctUJA0wuFZEjriBzEWwACD/Cmp+gitOSWygK7o1tYlAta+/FBPAPEYXIaoWWZX
 rHV5OQarH69REQh56NS/taliFho4x0n9V0jLt07pPD/SoxaO30pkbuilBymgGF0l4D+xc/GITLX
 n/ekXZsi7YOapBq+UmQjJvUUhwJY7tO19bJuq/IUsrRThGGYGsOGjtdCnnfEJOffIk3z2nzQIib
 dF6rLq7P6e4HQYfbg6Lt6qBV3zyhTHBqIHYmKuYQJnsTqFlvRYmLSLTJ5IFW47e8BFjBaHmR0IH
 XbQB68/7k5Jj4tYho59UJGdnH2n9OsMVWkL1ArZs724GoQb22q4EhuJzfHoxA0ZNBi2RDC6d3+Y
 ViaKdqJ3vgU1tH1dfoPxFRC1WyYOQZg==
X-Google-Smtp-Source: AGHT+IFbVhqlXAiYz/XTvk4x+0j0VkgVR1seTdnyfFoTMNPuecjH2oj/q4gOboqA7a780qHNp6jIrw==
X-Received: by 2002:a17:902:d583:b0:234:9fee:af95 with SMTP id
 d9443c01a7336-2365f7a34d0mr5735155ad.0.1749770183569; 
 Thu, 12 Jun 2025 16:16:23 -0700 (PDT)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com.
 [209.85.215.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365de782b2sm2639945ad.111.2025.06.12.16.16.22
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 16:16:22 -0700 (PDT)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b2fd091f826so1172897a12.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 12 Jun 2025 16:16:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU0yo/dJZXEjNKlYQ0Jh0g/ccJ4XCjMSiOVZXBTHhHaXoLMfRUJttNtLkOeIc89EIe3bDqxy+PceJpUnDJZNg==@lists.sourceforge.net
X-Received: by 2002:a17:90b:588b:b0:2ff:556f:bf9 with SMTP id
 98e67ed59e1d1-313dc227afamr497218a91.4.1749770181738; Thu, 12 Jun 2025
 16:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-4-f427c743dda0@suse.com>
 <CAD=FV=XXQyZLYKoszj68ZGFDY=9-cmEUp406WeOeSBVZOHyUHw@mail.gmail.com>
 <f962e9bab3dc8bf5cae1c7e187a54fb96a543d51.camel@suse.com>
 <CAD=FV=XFeokpbMUFjAc0OkwJ97vR8aB+4GbnFxRKymvpEY3gnA@mail.gmail.com>
 <aErcrCKcsi9cpANY@pathway.suse.cz>
In-Reply-To: <aErcrCKcsi9cpANY@pathway.suse.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Jun 2025 16:16:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WFWviPPR6VWmsN2-+vzRDoU6oTNH=EP6z1usG4EDR3+w@mail.gmail.com>
X-Gm-Features: AX0GCFujYjZY5QQA0SHYIPZy8d0O0rad7ID3hPYo1lls7-hp2LxFCT3Du9JnL2k
Message-ID: <CAD=FV=WFWviPPR6VWmsN2-+vzRDoU6oTNH=EP6z1usG4EDR3+w@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Thu, Jun 12,
 2025 at 6:57 AM Petr Mladek <pmladek@suse.com>
 wrote: > > > > > > @@ -577, 7 +577,
 8 @@ static int __init kgdboc_earlycon_init(char
 > > > > > *opt) > > > > > console_list_lock(); > > > > [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
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
 [209.85.219.54 listed in wl.mailspike.net]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPrZs-0005C1-J6
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

SGksCgpPbiBUaHUsIEp1biAxMiwgMjAyNSBhdCA2OjU34oCvQU0gUGV0ciBNbGFkZWsgPHBtbGFk
ZWtAc3VzZS5jb20+IHdyb3RlOgo+Cj4gPiA+ID4gPiBAQCAtNTc3LDcgKzU3Nyw4IEBAIHN0YXRp
YyBpbnQgX19pbml0IGtnZGJvY19lYXJseWNvbl9pbml0KGNoYXIKPiA+ID4gPiA+ICpvcHQpCj4g
PiA+ID4gPiAgICAgICAgIGNvbnNvbGVfbGlzdF9sb2NrKCk7Cj4gPiA+ID4gPiAgICAgICAgIGZv
cl9lYWNoX2NvbnNvbGUoY29uKSB7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgaWYgKGNvbi0+
d3JpdGUgJiYgY29uLT5yZWFkICYmCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgIChjb24t
PmZsYWdzICYgKENPTl9CT09UIHwgQ09OX0VOQUJMRUQpKSAmJgo+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAoY29uLT5mbGFncyAmIENPTl9CT09UKSAmJgo+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAoKGNvbi0+ZmxhZ3MgJiBDT05fU1VTUEVOREVEKSA9PSAwKSAmJgo+ID4gPiA+
Cj4gPiA+ID4gSSBoYXZlbid0IHRyaWVkIHJ1bm5pbmcgdGhlIGNvZGUsIHNvIEkgY291bGQgZWFz
aWx5IGJlIG1pc3Rha2VuLAo+ID4gPiA+IGJ1dC4uLgo+ID4gPiA+Cj4gPiA+ID4gLi4udGhlIGFi
b3ZlIGRvZXNuJ3Qgc2VlbSBsaWtlIHRoZSBjb3JyZWN0IGNvbnZlcnNpb24uIFRoZSBvbGQKPiA+
ID4gPiBleHByZXNzaW9uIHdhczoKPiA+ID4gPgo+ID4gPiA+IChjb24tPmZsYWdzICYgKENPTl9C
T09UIHwgQ09OX0VOQUJMRUQpKQo+ID4gPiA+Cj4gPiA+ID4gVGhhdCB3b3VsZCBldmFsdWF0ZSB0
byBub24temVybyAodHJ1ZSkgaWYgdGhlIGNvbnNvbGUgd2FzIF9laXRoZXJfCj4gPiA+ID4gImJv
b3QiIG9yICJlbmFibGVkIi4KPiA+ID4gPgo+ID4gPiA+IFRoZSBuZXcgZXhwcmVzc2lvbiBpcyBp
czoKPiA+ID4gPgo+ID4gPiA+IChjb24tPmZsYWdzICYgQ09OX0JPT1QpICYmICgoY29uLT5mbGFn
cyAmIENPTl9TVVNQRU5ERUQpID09IDApCj4gPiA+ID4KPiA+ID4gPiBUaGF0J3Mgb25seSB0cnVl
IGlmIHRoZSBjb25zb2xlIGlzIF9ib3RoXyAiYm9vdCIgYW5kICJub3Qgc3VzcGVuZGVkIi4KPiA+
ID4KPiA+ID4gTXkgaWRlYSBoZXJlIHdhcyB0aGF0IHRoZSB1c2VycyBvZiBmb3JfZWFjaF9jb25z
b2xlIHdvdWxkIGZpbmQgdGhlCj4gPiA+IGZpcnN0IGF2YWlsYWJsZSBjb25zb2xlLCBhbmQgYnkg
YXZhaWxhYmxlIEkgd291bGQgZXhwZWN0IHRoZW0gdG8gYmUKPiA+ID4gdXNhYmxlLiBJbiB0aGlz
IGNhc2UsIGlzIHRoZXJlIGFueSB2YWx1ZSBmb3Iga2dkYm9jIHRvIHVzZSBhIGNvbnNvbGUKPiA+
ID4gdGhhdCBpcyBzdXNwZW5kZWQ/IFdvdWxkIGl0IHdvcmsgaW4gdGhpcyBjYXNlPwo+ID4gPgo+
ID4gPiBJIG5ldmVyIHJlYWxseSB1c2VkIGtnZGJvYywgYnV0IG9ubHkgY2hlY2tpbmcgaWYgdGhl
IGNvbnNvbGUgd2FzCj4gPiA+IGVuYWJsZWQgKHdoaWNoIGl0J3MgYWx3YXlzIHRoZSBjYXNlIGhl
cmUpIHdhcyBzb21ldGhpbmcgdGhhdCBuZWVkZWQgdG8KPiA+ID4gYmUgZml4ZWQuCj4gPiA+Cj4g
PiA+IE1heWJlIEknbSBtaXNzaW5nIHNvbWV0aGluZyBoZXJlIGFzIHdlbGwsIHNvIHBsZWFzZSBs
ZXQgbWUga25vdyBpZiBJCj4gPiA+IHNob3VsZCByZW1vdmUgdGhlIG5ldyBjaGVjay4KPiA+Cj4g
PiBTbyBpdCdzIGJlZW4gNSB5ZWFycyBzaW5jZSBJIHdyb3RlIHRoZSBjb2RlLCBidXQgcmVhZGlu
ZyB0aGF0IEkgd2FzCj4gPiBjaGVja2luZyBmb3I6Cj4gPgo+ID4gICAoY29uLT5mbGFncyAmIChD
T05fQk9PVCB8IENPTl9FTkFCTEVEKSkKPiA+Cj4gPiBNYWtlcyBtZSBiZWxpZXZlIHRoYXQgdGhp
cyB3YXMgdGhlIGNhc2Ugd2hlbiBJIHdyb3RlIHRoZSBjb2RlOgo+ID4gMS4gRWFybHkgYm9vdCBj
b25zb2xlcyAoZWFybHljb24pIHdlcmUgbm90IG1hcmtlZCBhcyBDT05fRU5BQkxFRCBidXQKPiA+
IHdlcmUgaW5zdGVhZCBtYXJrZWQgYXMgQ09OX0JPT1QuCj4gPiAyLiBPbmNlIGNvbnNvbGVzIGJl
Y2FtZSBub24tZWFybHkgdGhleSB3ZXJlIG1vdmVkIHRvIENPTl9FTkFCTEVELgo+ID4KPiA+IC4u
LmFuZCB0aGUgY29kZSB3YXMgYmFzaWNhbGx5IGxvb2tpbmcgZm9yIGFueSBjb25zb2xlcyB3aXRo
IGEgbWF0Y2hpbmcKPiA+IG5hbWUgdGhhdCB3ZXJlIGVpdGhlciBib290IGNvbnNvbGVzIG9yIG5v
cm1hbC9lbmFibGVkIGNvbnNvbGVzLgo+ID4KPiA+IElzIHRoYXQgYSBwbGF1c2libGUgdGhlb3J5
PyBJdCdzIGFsc28gcG9zc2libGUgdGhhdCBJIGp1c3Qgd2FzCj4gPiBjb25mdXNlZCB3aGVuIEkg
Y29kZSB0aGluZ3MgdXAgYW5kIHRoYXQgSSByZWFsbHkgbWVhbnQgdG8gd3JpdGU6Cj4KPiBJdCBp
cyBlYXN5IHRvIGdldCBjb25mdXNlZCBieSB0aGUgcmVnaXN0ZXJfY29uc29sZSgpIGNvZGUuIEFu
ZAo+IGl0IGhhcyBiZWVuIGV2ZW4gd29yc2Ugc29tZSB5ZWFycyBhZ28uCj4KPiBBbnl3YXksIHRo
ZSBjdXJyZW50IGNvZGUgc2V0cyBDT05fRU5BQkxFRCBmb3IgYWxsIHJlZ2lzdGVyZWQKPiBjb25z
b2xlcywgaW5jbHVkaW5nIENPTl9CT09UIGNvbnNvbGVzLiBUaGUgZmxhZyBpcyBjbGVhcmVkIG9u
bHkKPiBieSBjb25zb2xlX3N1c3BlbmQoKVsqXSBvciB1bnJlZ2lzdGVyX2NvbnNvbGUoKS4KPgo+
IElNSE8sIGtnZGJvY19lYXJseWNvbl9pbml0KCkgZG9lcyBub3QgbmVlZCB0byBjYXJlIGFib3V0
Cj4gY29uc29sZV9zdXNwZW5kKCkgYmVjYXVzZSB0aGUga2VybmVsIGNvdWxkIG5vdCBiZSBzdXNw
ZW5kZWQKPiBkdXJpbmcgYm9vdC4gRG9lcyB0aGlzIG1ha2VzIHNlbnNlPwoKWWVhaCwgbWFrZXMg
c2Vuc2UgdG8gbWUuCgoKPiBBbHNvIGl0IGRvZXMgbm90IG5lZWQgdG8gY2FyZSBhYm91dCB1bnJl
Z2lzdGVyX2NvbnNvbGUoKSBiZWNhdXNlCj4gdGhlIHVucmVnaXN0ZXJlZCBjb25zb2xlIHdvbid0
IGJlIGxpc3RlZCBieSBmb3JfZWFjaF9jb25zb2xlKCkuCj4KPiBbKl0gVGhlIDFzdCBwYXRjaCBp
biB0aGlzIHBhdGNoc2V0IHVwZGF0ZXMgY29uc29sZV9zdXNwZW5kKCkKPiAgICAgdG8gc2V0IENP
Tl9TVVNQRU5ERUQgaW5zdGVhZCBvZiBjbGVhcmluZyBDT05fRU5BQkxFRC4KPiAgICAgSXQgaGVs
cHMgdG8gbWFrZSBpdCBjbGVhciB0aGF0IGl0IGlzIHN1c3BlbmQtcmVsYXRlZC4KPgo+Cj4gUmVz
dW1lOgo+Cj4gSSB3b3VsZCByZW1vdmUgdGhlIGNoZWNrIG9mIENPTl9FTkFCTEVEIG9yIENPTl9T
VVNQRU5ERUQKPiBmcm9tIGtnZGJvY19lYXJseWNvbl9pbml0KCkgY29tcGxldGVseS4KPgo+IElN
SE8sIHdlIHNob3VsZCBrZWVwIHRoZSBjaGVjayBvZiBDT05fQk9PVCBiZWNhdXNlIHdlIGRvIG5v
dAo+IHdhbnQgdG8gcmVnaXN0ZXIgIm5vcm1hbCIgY29uc29sZSBkcml2ZXJzIGFzIGtnZGJvY19l
YXJseWNvbl9pb19vcHMuCj4gSXQgaXMgbGF0ZXIgcmVtb3ZlZCBieSBrZ2Rib2NfZWFybHljb25f
ZGVpbml0KCkuIEkgZ3Vlc3MKPiB0aGF0IHRoZSBjb2RlIGlzIG5vdCByZWFkeSB0byBoYW5kbGUg
YSB0YWtlb3ZlciBmcm9tIG5vcm1hbAo+IHRvIG5vcm1hbCAoZXZlbiB0aGUgc2FtZSkgY29uc29s
ZSBkcml2ZXIuCgpJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHlvdXIgbGFzdCBzZW50ZW5jZSB0
aGVyZS4gSW4gZ2VuZXJhbCB0aGUKY29kZSBoYW5kbGluZyBhbGwgb2YgdGhlIHBvc3NpYmxlIGhh
bmRvZmYgKG9yIGxhY2sgb2YgaGFuZG9mZikgY2FzZXMKYmV0d2VlbiBrZ2Rib2NfZWFybHljb24g
YW5kIHJlZ3VsYXIga2dkYm9jIGlzIHByZXR0eSB3YWNreS4gQXQgb25lCnBvaW50IEkgdGhvdWdo
dCB0aHJvdWdoIGl0IGFsbCBhbmQgdHJpZWQgdG8gdGVzdCBhcyBtYW55IHNjZW5hcmlvcyBhcwpJ
IGNvdWxkIGFuZCBJIHNlZW0gdG8gcmVtZW1iZXIgdHJ5aW5nIHRvIG1vZGVsIHNvbWUgb2YgdGhl
IGJlaGF2aW9yIG9uCmhvdyBlYXJseWNvbiB3b3JrZWQuIElmIHNvbWV0aGluZyBsb29rcyBicm9r
ZW4gaGVyZSB0aGVuIGxldCBtZSBrbm93LgoKCj4gVG8gbWFrZSBpdCBjbGVhciwgSSB3b3VsZCB1
c2U6Cj4KPiAgICAgICAgIGZvcl9lYWNoX2NvbnNvbGUoY29uKSB7Cj4gICAgICAgICAgICAgICAg
IGlmIChjb24tPndyaXRlICYmIGNvbi0+cmVhZCAmJgo+ICAgICAgICAgICAgICAgICAgICAgKGNv
bi0+ZmxhZ3MgJiBDT05fQk9PVCkgJiYKPiAgICAgICAgICAgICAgICAgICAgICghb3B0IHx8ICFv
cHRbMF0gfHwgc3RyY21wKGNvbi0+bmFtZSwgb3B0KSA9PSAwKSkKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBicmVhazsKPiAgICAgICAgIH0KPgo+IEFuZCBJIHdvdWxkIGRvIHRoaXMgY2hhbmdl
IGFzIHRoZSAxc3QgcGF0Y2ggaW4gdGhlIHBhdGNoc2V0Cj4gYmVmb3JlIHdlIGNoYW5nZSB0aGUg
ZmxhZyBtb2RpZmllZCBieSBjb25zb2xlX3N1c3BlbmQoKS4KClNlZW1zIE9LIHRvIG1lLgoKLURv
dWcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2Ri
LWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVn
cmVwb3J0Cg==
