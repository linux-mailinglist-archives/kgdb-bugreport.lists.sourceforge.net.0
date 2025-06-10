Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C6FAD46EC
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 11 Jun 2025 01:43:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXY/HZZwFtw/atUMYuIoCnweGhqbR1TXr+BOSCaa/0E=; b=RXHwcFeFTlwXiOIhISLjQmMjV3
	f8QV6QmcHb44znmRcbQCEMafQ2uoJWEK2Gx6H7dzgXZCLzQDF/WDDSk0LGUMcCfZGHVzQxO+Z++FB
	Io7f+fgkx95PyesGl9ONEPnNkDURs0rrx8k8PTSCZKJ3qaQ5+QluUzzLr+lu+1B5Ikng=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uP8cO-0005ZT-DD
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 10 Jun 2025 23:43:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1uP8cM-0005ZE-Pi
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 10 Jun 2025 23:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mtgyGRFsx3W1moknyTRh8eklG3kKIqbE5e8lYnyeAfo=; b=fJe/cYMPZAhS3oIb7ssJx3UCpK
 tB82jx7ofv83JEaN7gZ8rbuQ4mQarA5YraaM3weIGb7aeBRf5zh58BnG+pMuQ/K08VVvtJJMFabYc
 +zavumzfkYeIIlyNKDqt2v5ph6gXiXWllVwzy5FHl2/apVKxuXfSA23lqJXXyqxRxbsA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mtgyGRFsx3W1moknyTRh8eklG3kKIqbE5e8lYnyeAfo=; b=m1OsVL9T0/VRUBeP7yrkHpb8NB
 V0NVs41Y5RzymwJdfn1eumPHw1x1nnOXbNl7Ytzcl7P3CGhmUbrapTKCy10FSs4MrQ/KsJuykGXa9
 afJq3hb3kDIp19WY/rLiIt92acRVEOvT3c/vgd73eOENCE0pMLmE4k83uzHVmJBAvTE8=;
Received: from mail-qk1-f175.google.com ([209.85.222.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP8cL-0006tM-VB for kgdb-bugreport@lists.sourceforge.net;
 Tue, 10 Jun 2025 23:42:58 +0000
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7d0a0bcd3f3so38710185a.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 10 Jun 2025 16:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749598971; x=1750203771;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mtgyGRFsx3W1moknyTRh8eklG3kKIqbE5e8lYnyeAfo=;
 b=FvIEXJ6V/wMBfwrNUPBdQKLHek0e9oEW+v3NP9tS22C+3JYp564rvIKB+XKQC7Stu2
 774zAFACBCecWdQmf9xJcQ8UFzc8allRngPBeHzz9jT8zRubehNtioF9f1GTJNhZVJAT
 zpYUfoRTxRMhJSCKBNCE5z1osPIrivkEdt2b8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749598971; x=1750203771;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mtgyGRFsx3W1moknyTRh8eklG3kKIqbE5e8lYnyeAfo=;
 b=kJnzSFz2oV+nDgE+qNcRoTLnt8KymP7Heh7zhqWdZewVMTHDX1WN/AGbdLzc/zyOLe
 l7NlaGNAlP8pfjjnMulZfDBdDvH8yYSeJkZIpNi0gPm5zhWPBIm9iu/49C44RkIrMIfy
 9sNkmoRpUVOGBzrTW+P9YCb/9/fvRp4Bys64HtRDMeGQaH/kU/WZT1mU3f8CkFYtPh+T
 g8ROzn1ASpvxc2rzlcaj/Bgjd7O+WfTOaclRpq6fUKzzvVEggf/Chqm101gBtVMP2l0i
 PuDr3x2TPpt/Psm7p82RqWUJPhcJdPHbmIO4HAlk5hkVGIfu3H8fn5F2+I0RO5czv9Hs
 2MPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/mD8N231+YIjoCUzWMR1bLOZKW8+3ce0TiFITDY6f64N/GJYJaKIvsVqmZOebnmqdnAF0r1Uje0jUDlDzBg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyBvMYFOflR8oCsn6X+wj+2m0kYQdqftzBkLT2SBUywWrv4ocXB
 SIrSQ/Nz+j7DrrvksT7phDNI+cfLDXDDtIWf+JdQXSo+IWL3vPk+JRXopxuFJuDmRd4qt8Else0
 d6sU=
X-Gm-Gg: ASbGncsmaLdkHE/pj7oeEyleXYuncl9M8AFn1VqNFENjGtNt1fbtDS3GYfKN/t7YfHS
 SFcLpYKY6VHZigCdBy1NCz2rOX0/miz3AQYFEDSXXbuvIW6I0VyM9L8WgdLnRWajPKs2g7477ZX
 kHCpMvEKRM4kuf0mikUvSdqG99YQX78DYRvtYl8ziXWQjaXmpA3chEv2kGGtCiFrR3gDKvy9zES
 IazREJv4Q+V0+GxrE9C9Cqi+E+C0tHQU8sKOY4yBtapjACjkYBRgIU1tw4xwEwCLOK8WHPET7j6
 tV2psuGGPRAHzi+vApM0VsIMpK0LQEXY/wEid+0KMfnspnFNcuzWqz1UNie6hogv1a8BVgRxqzQ
 6vxzdWAp1dhvwkxMISKKiXs6Lsg==
X-Google-Smtp-Source: AGHT+IHqj8FmApgaCZ170a7By7WRcHjeRAlw2Bne584Elq0QLsb6yHQmdP+u31q/0L4MMXOBwPF4Rw==
X-Received: by 2002:a17:902:d543:b0:234:9ef7:a189 with SMTP id
 d9443c01a7336-23641817423mr16852695ad.13.1749597518377; 
 Tue, 10 Jun 2025 16:18:38 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com.
 [209.85.216.48]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236032fce89sm76556125ad.94.2025.06.10.16.18.36
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 16:18:36 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-313a188174fso304215a91.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 10 Jun 2025 16:18:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX9xvW0WtUgN4UIeffVxF2V2blt7xvxK23SvlKwCahLyGUW4uWrf7X77Ygmmgl3dDcTW0PwrsZqs0qeaukdXw==@lists.sourceforge.net
X-Received: by 2002:a17:90b:3908:b0:311:ab20:1591 with SMTP id
 98e67ed59e1d1-313af9711a2mr1450240a91.15.1749597515737; Tue, 10 Jun 2025
 16:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-4-f427c743dda0@suse.com>
 <CAD=FV=XXQyZLYKoszj68ZGFDY=9-cmEUp406WeOeSBVZOHyUHw@mail.gmail.com>
 <f962e9bab3dc8bf5cae1c7e187a54fb96a543d51.camel@suse.com>
In-Reply-To: <f962e9bab3dc8bf5cae1c7e187a54fb96a543d51.camel@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Jun 2025 16:18:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XFeokpbMUFjAc0OkwJ97vR8aB+4GbnFxRKymvpEY3gnA@mail.gmail.com>
X-Gm-Features: AX0GCFt6n77pbmil8IDH9ETyvVBk9GLYcHe7RwT91u86Q2sJf5v-ZMY6TwpptAA
Message-ID: <CAD=FV=XFeokpbMUFjAc0OkwJ97vR8aB+4GbnFxRKymvpEY3gnA@mail.gmail.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Tue, Jun 10, 2025 at 1:03 PM Marcos Paulo de Souza
 <mpdesouza@suse.com> wrote: > > On Mon, 2025-06-09 at 13:13 -0700,
 Doug Anderson
 wrote: > > Hi, > > > > On Fri, Jun 6, 2025 at 7:54 PM Marcos Paul [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.175 listed in wl.mailspike.net]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uP8cL-0006tM-VB
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
Cc: Petr Mladek <pmladek@suse.com>, Richard Weinberger <richard@nod.at>,
 John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Johannes Berg <johannes@sipsolutions.net>, Jiri Slaby <jirislaby@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUdWUsIEp1biAxMCwgMjAyNSBhdCAxOjAz4oCvUE0gTWFyY29zIFBhdWxvIGRlIFNv
dXphCjxtcGRlc291emFAc3VzZS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAyMDI1LTA2LTA5IGF0
IDEzOjEzIC0wNzAwLCBEb3VnIEFuZGVyc29uIHdyb3RlOgo+ID4gSGksCj4gPgo+ID4gT24gRnJp
LCBKdW4gNiwgMjAyNSBhdCA3OjU04oCvUE0gTWFyY29zIFBhdWxvIGRlIFNvdXphCj4gPiA8bXBk
ZXNvdXphQHN1c2UuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gQWxsIGNvbnNvbGVzIGZvdW5kIG9u
IGZvcl9lYWNoX2NvbnNvbGUgYXJlIHJlZ2lzdGVyZWQsIG1lYW5pbmcgdGhhdAo+ID4gPiBhbGwg
b2YKPiA+ID4gdGhlbSBhcmUgQ09OX0VOQUJMRUQuIFRoZSBjb2RlIHRyaWVzIHRvIGZpbmQgYW4g
YWN0aXZlIGNvbnNvbGUsIHNvCj4gPiA+IGNoZWNrIGlmIHRoZQo+ID4gPiBjb25zb2xlIGlzIG5v
dCBzdXNwZW5kZWQgaW5zdGVhZC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWFyY29zIFBh
dWxvIGRlIFNvdXphIDxtcGRlc291emFAc3VzZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVy
cy90dHkvc2VyaWFsL2tnZGJvYy5jIHwgMyArKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdHR5L3NlcmlhbC9rZ2Rib2MuYwo+ID4gPiBiL2RyaXZlcnMvdHR5L3NlcmlhbC9rZ2Rib2Mu
Ywo+ID4gPiBpbmRleAo+ID4gPiA4NWY2YzVhNzZlMGZmZjU1NmY4NmYwZDQ1ZWJjNWFhZGY1YjE5
MWU4Li5hZjZkMjIwOGI4ZGRiODJkNjJmMzMyOTJiCj4gPiA+IDAwNmIyOTIzNTgzYTBkMiAxMDA2
NDQKPiA+ID4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL2tnZGJvYy5jCj4gPiA+ICsrKyBiL2Ry
aXZlcnMvdHR5L3NlcmlhbC9rZ2Rib2MuYwo+ID4gPiBAQCAtNTc3LDcgKzU3Nyw4IEBAIHN0YXRp
YyBpbnQgX19pbml0IGtnZGJvY19lYXJseWNvbl9pbml0KGNoYXIKPiA+ID4gKm9wdCkKPiA+ID4g
ICAgICAgICBjb25zb2xlX2xpc3RfbG9jaygpOwo+ID4gPiAgICAgICAgIGZvcl9lYWNoX2NvbnNv
bGUoY29uKSB7Cj4gPiA+ICAgICAgICAgICAgICAgICBpZiAoY29uLT53cml0ZSAmJiBjb24tPnJl
YWQgJiYKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAoY29uLT5mbGFncyAmIChDT05fQk9PVCB8
IENPTl9FTkFCTEVEKSkgJiYKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAoY29uLT5mbGFncyAm
IENPTl9CT09UKSAmJgo+ID4gPiArICAgICAgICAgICAgICAgICAgICgoY29uLT5mbGFncyAmIENP
Tl9TVVNQRU5ERUQpID09IDApICYmCj4gPgo+ID4gSSBoYXZlbid0IHRyaWVkIHJ1bm5pbmcgdGhl
IGNvZGUsIHNvIEkgY291bGQgZWFzaWx5IGJlIG1pc3Rha2VuLAo+ID4gYnV0Li4uCj4gPgo+ID4g
Li4udGhlIGFib3ZlIGRvZXNuJ3Qgc2VlbSBsaWtlIHRoZSBjb3JyZWN0IGNvbnZlcnNpb24uIFRo
ZSBvbGQKPiA+IGV4cHJlc3Npb24gd2FzOgo+ID4KPiA+IChjb24tPmZsYWdzICYgKENPTl9CT09U
IHwgQ09OX0VOQUJMRUQpKQo+ID4KPiA+IFRoYXQgd291bGQgZXZhbHVhdGUgdG8gbm9uLXplcm8g
KHRydWUpIGlmIHRoZSBjb25zb2xlIHdhcyBfZWl0aGVyXwo+ID4gImJvb3QiIG9yICJlbmFibGVk
Ii4KPiA+Cj4gPiBUaGUgbmV3IGV4cHJlc3Npb24gaXMgaXM6Cj4gPgo+ID4gKGNvbi0+ZmxhZ3Mg
JiBDT05fQk9PVCkgJiYgKChjb24tPmZsYWdzICYgQ09OX1NVU1BFTkRFRCkgPT0gMCkKPiA+Cj4g
PiBUaGF0J3Mgb25seSB0cnVlIGlmIHRoZSBjb25zb2xlIGlzIF9ib3RoXyAiYm9vdCIgYW5kICJu
b3Qgc3VzcGVuZGVkIi4KPgo+IE15IGlkZWEgaGVyZSB3YXMgdGhhdCB0aGUgdXNlcnMgb2YgZm9y
X2VhY2hfY29uc29sZSB3b3VsZCBmaW5kIHRoZQo+IGZpcnN0IGF2YWlsYWJsZSBjb25zb2xlLCBh
bmQgYnkgYXZhaWxhYmxlIEkgd291bGQgZXhwZWN0IHRoZW0gdG8gYmUKPiB1c2FibGUuIEluIHRo
aXMgY2FzZSwgaXMgdGhlcmUgYW55IHZhbHVlIGZvciBrZ2Rib2MgdG8gdXNlIGEgY29uc29sZQo+
IHRoYXQgaXMgc3VzcGVuZGVkPyBXb3VsZCBpdCB3b3JrIGluIHRoaXMgY2FzZT8KPgo+IEkgbmV2
ZXIgcmVhbGx5IHVzZWQga2dkYm9jLCBidXQgb25seSBjaGVja2luZyBpZiB0aGUgY29uc29sZSB3
YXMKPiBlbmFibGVkICh3aGljaCBpdCdzIGFsd2F5cyB0aGUgY2FzZSBoZXJlKSB3YXMgc29tZXRo
aW5nIHRoYXQgbmVlZGVkIHRvCj4gYmUgZml4ZWQuCj4KPiBNYXliZSBJJ20gbWlzc2luZyBzb21l
dGhpbmcgaGVyZSBhcyB3ZWxsLCBzbyBwbGVhc2UgbGV0IG1lIGtub3cgaWYgSQo+IHNob3VsZCBy
ZW1vdmUgdGhlIG5ldyBjaGVjay4KClNvIGl0J3MgYmVlbiA1IHllYXJzIHNpbmNlIEkgd3JvdGUg
dGhlIGNvZGUsIGJ1dCByZWFkaW5nIHRoYXQgSSB3YXMKY2hlY2tpbmcgZm9yOgoKICAoY29uLT5m
bGFncyAmIChDT05fQk9PVCB8IENPTl9FTkFCTEVEKSkKCk1ha2VzIG1lIGJlbGlldmUgdGhhdCB0
aGlzIHdhcyB0aGUgY2FzZSB3aGVuIEkgd3JvdGUgdGhlIGNvZGU6CjEuIEVhcmx5IGJvb3QgY29u
c29sZXMgKGVhcmx5Y29uKSB3ZXJlIG5vdCBtYXJrZWQgYXMgQ09OX0VOQUJMRUQgYnV0CndlcmUg
aW5zdGVhZCBtYXJrZWQgYXMgQ09OX0JPT1QuCjIuIE9uY2UgY29uc29sZXMgYmVjYW1lIG5vbi1l
YXJseSB0aGV5IHdlcmUgbW92ZWQgdG8gQ09OX0VOQUJMRUQuCgouLi5hbmQgdGhlIGNvZGUgd2Fz
IGJhc2ljYWxseSBsb29raW5nIGZvciBhbnkgY29uc29sZXMgd2l0aCBhIG1hdGNoaW5nCm5hbWUg
dGhhdCB3ZXJlIGVpdGhlciBib290IGNvbnNvbGVzIG9yIG5vcm1hbC9lbmFibGVkIGNvbnNvbGVz
LgoKSXMgdGhhdCBhIHBsYXVzaWJsZSB0aGVvcnk/IEl0J3MgYWxzbyBwb3NzaWJsZSB0aGF0IEkg
anVzdCB3YXMKY29uZnVzZWQgd2hlbiBJIGNvZGUgdGhpbmdzIHVwIGFuZCB0aGF0IEkgcmVhbGx5
IG1lYW50IHRvIHdyaXRlOgoKKChjb24tPmZsYWdzICYgKENPTl9CT09UIHwgQ09OX0VOQUJMRUQp
KSA9PSAoQ09OX0JPT1QgfCBDT05fRU5BQkxFRCkpCgouLi5BS0EgdGhhdCBJIHdhbnRlZCBjb25z
b2xlcyB0aGF0IHdlcmUgQk9PVCBfYW5kXyBFTkFCTEVELgoKSW4gYW55IGNhc2UsIEkgYm9vdGVk
IHVwIHRoZSBjdXJyZW50IG1haW5saW5lIGFuZCBJIHB1dCBhIHByaW50b3V0IGhlcmUuIEkgc2F3
OgoKWyAgICAwLjAwMDAwMF0ga2dkYm9jOiBET1VHOiBjb25zb2xlIHFjb21fZ2VuaSBoYXMgZmxh
Z3MgMHgwMDAwMDAwZgoKU28gdGhhdCBtZWFucyB0aGF0IGJvdGggQk9PVCBhbmQgRU5BQkxFRCB3
ZXJlIHNldC4gVGhhdCBtYWtlcyBtZSBmZWVsCmxpa2UgaXQncyBwbGF1c2libGUgdGhhdCBJIHdh
cyBjb25mdXNlZCBhbmQgcmVhbGx5IG1lYW50IEJPT1QgX2FuZF8KRU5BQkxFRC4gSSBkaWRuJ3Qg
c3BlbmQgdGltZSB0cnlpbmcgdG8gZmlndXJlIG91dCBob3cgdG8gYnVpbGQvYm9vdCBhbgpvbGQg
a2VybmVsIHRvIGNoZWNrLCB0aG91Z2guCgpJbiBhbnkgY2FzZSwgZ2l2ZW4gbXkgdGVzdCB0aGVu
IEkgdGhpbmsgeW91ciBjaGFuZ2Ugc2hvdWxkIGJlIGZpbmUuCkdpdmVuIHRoYXQgaXQgZG9lcyBj
aGFuZ2UgdGhlIGJvb2xlYW4gbG9naWMsIGl0IHNlZW1zIGxpa2UgdGhhdApkZXNlcnZlcyBhIG1l
bnRpb24gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKLURvdWcKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QK
S2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
