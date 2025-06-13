Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A28AD92FE
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 13 Jun 2025 18:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DwIzbxoUtMnCFYZij67pN1w22jcWXQaXiKkDkKyTQ0Y=; b=JQnhEs8Yx4hb02N/srC/VcHf0O
	qnb/mvuWnR0TtMl65RWjRf1MsxpGQwes+HkNjhkyh2LNZxt0/WF+EUpUGRb2QdoEyRqdeMrC4N5x4
	0NAzeYICzsrFHt+aAQhO/O/i5iukQYTU6cF/Yv87ioCI3gNQdrtMP4gq+Hn2kvIdFeyI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uQ7WH-0007dO-R3
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 13 Jun 2025 16:44:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1uQ7WF-0007dF-Uw
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Jun 2025 16:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oFsHs2L6+8EBoJ/ILRzyWwmWoJe5zrU0k/YrygGMeNA=; b=cgFZM+bcrg2fXjqtV07tAVaxPw
 ZVgKu2BV4E6NMgIJR8jMr7gLboCWVCCauCk5TIyvmKEun50A7AXvqO9BwnLW1psweVPEG6Yue8vQ3
 O0rDlUCZRFsGy73s2WxrJRrCC2mdDa9D5BE4KmwHXF/AtXjRX8/slbclsEL2hejBUegs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oFsHs2L6+8EBoJ/ILRzyWwmWoJe5zrU0k/YrygGMeNA=; b=Uo3rweFFdW170EPMqF+WDYPfAh
 yb8pJH0skf9RzuzqC89FU9IZ5f2SIBvGRbTrk+G+5AaIt4JVPnRS9l3Toc9SU37R79iu09zod0R3r
 OtzHEPuIGqmTzbSZn/+4YilXd7quVx3+n1TxiNI4hpNPhCONOW/TavaaB8KssNMoGfkA=;
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uQ7WF-0003Ct-Bd for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Jun 2025 16:44:43 +0000
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7406c6dd2b1so3294804b3a.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 13 Jun 2025 09:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749833073; x=1750437873;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oFsHs2L6+8EBoJ/ILRzyWwmWoJe5zrU0k/YrygGMeNA=;
 b=F0e/00tmahUSYg0npTxHtEEfigmfT608JUsp1ioAMQxkk1e1uD4QF2mrG6iCsStHKz
 K2O3r1IkSDPN/P9SMOo95r3RlXnvVwfYARVB83qQAYUoTV2Bj9yg3pAxrULdHNxHB51P
 ZrhxLIag57NkW6ly7/PzQydc5+9biWfFDX2YU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749833073; x=1750437873;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oFsHs2L6+8EBoJ/ILRzyWwmWoJe5zrU0k/YrygGMeNA=;
 b=VwpGvPTiTc8qskn3WOF4wcwrdciUdkgtZ0LgOOywc7nalqT9Kto8lbDECaUvZL7+Vb
 C/warqjeCP+EyBag/D0R8FMzAQ69THcWZ2YjxijUxw3McEWymmkOQOkHeEVCDK+qoSW8
 BGq9InI2i+dykVZM+rHBtHvyVsOSRvgnfDZ7WPbKVVxAWR5XAb9uEJcRCRR1GTH1KJXc
 lu15peTHx1WfLuWYg8uouijgG0mLgebAzVBdLAcPUT5FeSotzvXyBZzP4mwrpWpd8B4o
 +C01PPCzi/mhK9kZSHlJl2JwJV3qx8XsmJyYb+Po/BPOtTIv01/OTwRlpYTr53zIa7yK
 WWDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLBNwKGVqpI4sCPg/u3z/GQu4c5msE0QLWU67NdyU0eKonEdi7YgJRSGd/8Vi0VqgJiGt3oQa84yYtaoMrlA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyIlOUsg70vG/hJ7aIOu6x4pfDeAz02anJLlzXbC9ukTTcut48r
 4CQlGv1AOY6Vj7LoGDlhfYQAiUd8xDNVxvw8cU6qy2KZYWl0zo3wXy09kNii5YW1p2SHai3yRAI
 y0vo=
X-Gm-Gg: ASbGncutnMyhH0dtb+cn2myaYg3ZnHNlxWy0Cf1lECYwgbRaV97/Vt5wzQc8gV7QmQH
 sQA1TL2+K9yOwymibUVw56HHbj+eoiE0+aDIFcUc9kOE6WVnHHjYK4XZoRoJ/hDicdNliRUMt1n
 tvjrFDs2yJsrbdC8LFpdJsfHxg92+SdRoUAps0FBLhoEI8xbCtwT9BNUrlOsDFsLLOXk4Q5XlI5
 c1pb4ie/NwD1m23f8ATfd3vmszu02ly6k1y31KMGRR5moemeGivz5l3+CW322MvIIfPydKBn9Ls
 mqdp7qwMUjDxjT3U7JguRQbDds+lp8c7ALblQCfvakxD4T/wrxvhnLOM5IpUYDdQ6gjp9XdYKFG
 C4o7LKnDQJL8qwYQauWPoAFs8PTHG0w==
X-Google-Smtp-Source: AGHT+IHGZQnLDxbEgHN8NLOtyrXdRUWxnVjysY9HE8K6+w2qwkhmnklIphwD30eAyJQiW785iXPMrQ==
X-Received: by 2002:a05:6a00:8714:b0:736:b400:b58f with SMTP id
 d2e1a72fcca58-748981839e4mr1348194b3a.0.1749833072589; 
 Fri, 13 Jun 2025 09:44:32 -0700 (PDT)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com.
 [209.85.214.175]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7489008303fsm1799429b3a.79.2025.06.13.09.44.29
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jun 2025 09:44:30 -0700 (PDT)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2350fc2591dso23168625ad.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 13 Jun 2025 09:44:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVx2BwUHMJU644EvKLuA4llMxmInByUZMofD3rQz2LykwTMcvInUwD2H364CiEKxRh0TQJ2Zo9u251GZUv6jQ==@lists.sourceforge.net
X-Received: by 2002:a17:902:fc84:b0:234:9fe1:8fc6 with SMTP id
 d9443c01a7336-236678a6caamr20933585ad.18.1749833069252; Fri, 13 Jun 2025
 09:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-4-f427c743dda0@suse.com>
 <CAD=FV=XXQyZLYKoszj68ZGFDY=9-cmEUp406WeOeSBVZOHyUHw@mail.gmail.com>
 <f962e9bab3dc8bf5cae1c7e187a54fb96a543d51.camel@suse.com>
 <CAD=FV=XFeokpbMUFjAc0OkwJ97vR8aB+4GbnFxRKymvpEY3gnA@mail.gmail.com>
 <aErcrCKcsi9cpANY@pathway.suse.cz>
 <CAD=FV=WFWviPPR6VWmsN2-+vzRDoU6oTNH=EP6z1usG4EDR3+w@mail.gmail.com>
 <aEwC81RhvveGP73Y@pathway.suse.cz>
In-Reply-To: <aEwC81RhvveGP73Y@pathway.suse.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Jun 2025 09:44:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XwJ8b2Qd52dUG7DrbkVz2XdjCgXoThh2i3gi=+vGqFAw@mail.gmail.com>
X-Gm-Features: AX0GCFsbz4DtEeKeZs4XLMlp6WpvZqtedSANACGhbS0pNgSY94ZUMPk-yfpPG_M
Message-ID: <CAD=FV=XwJ8b2Qd52dUG7DrbkVz2XdjCgXoThh2i3gi=+vGqFAw@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Fri, Jun 13,
 2025 at 3:52 AM Petr Mladek <pmladek@suse.com>
 wrote: > > On Thu 2025-06-12 16:16:09, Doug Anderson wrote: > > Hi, > > >
 > On Thu, Jun 12, 2025 at 6:57 AM Petr Mladek <pmladek@suse.com [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uQ7WF-0003Ct-Bd
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

SGksCgpPbiBGcmksIEp1biAxMywgMjAyNSBhdCAzOjUy4oCvQU0gUGV0ciBNbGFkZWsgPHBtbGFk
ZWtAc3VzZS5jb20+IHdyb3RlOgo+Cj4gT24gVGh1IDIwMjUtMDYtMTIgMTY6MTY6MDksIERvdWcg
QW5kZXJzb24gd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBPbiBUaHUsIEp1biAxMiwgMjAyNSBhdCA2
OjU34oCvQU0gUGV0ciBNbGFkZWsgPHBtbGFkZWtAc3VzZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4g
PiA+ID4gPiA+IEBAIC01NzcsNyArNTc3LDggQEAgc3RhdGljIGludCBfX2luaXQga2dkYm9jX2Vh
cmx5Y29uX2luaXQoY2hhcgo+ID4gPiA+ID4gPiA+ICpvcHQpCj4gPiA+ID4gPiA+ID4gICAgICAg
ICBjb25zb2xlX2xpc3RfbG9jaygpOwo+ID4gPiA+ID4gPiA+ICAgICAgICAgZm9yX2VhY2hfY29u
c29sZShjb24pIHsKPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgaWYgKGNvbi0+d3JpdGUg
JiYgY29uLT5yZWFkICYmCj4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAoY29uLT5m
bGFncyAmIChDT05fQk9PVCB8IENPTl9FTkFCTEVEKSkgJiYKPiA+ID4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgICAgIChjb24tPmZsYWdzICYgQ09OX0JPT1QpICYmCj4gPiA+ID4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAoKGNvbi0+ZmxhZ3MgJiBDT05fU1VTUEVOREVEKSA9PSAwKSAmJgo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJIGhhdmVuJ3QgdHJpZWQgcnVubmluZyB0aGUgY29kZSwg
c28gSSBjb3VsZCBlYXNpbHkgYmUgbWlzdGFrZW4sCj4gPiA+ID4gPiA+IGJ1dC4uLgo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiAuLi50aGUgYWJvdmUgZG9lc24ndCBzZWVtIGxpa2UgdGhlIGNvcnJl
Y3QgY29udmVyc2lvbi4gVGhlIG9sZAo+ID4gPiA+ID4gPiBleHByZXNzaW9uIHdhczoKPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gKGNvbi0+ZmxhZ3MgJiAoQ09OX0JPT1QgfCBDT05fRU5BQkxFRCkp
Cj4gPiA+ID4gPiA+Cj4gPiA+IEl0IGlzIGVhc3kgdG8gZ2V0IGNvbmZ1c2VkIGJ5IHRoZSByZWdp
c3Rlcl9jb25zb2xlKCkgY29kZS4gQW5kCj4gPiA+IGl0IGhhcyBiZWVuIGV2ZW4gd29yc2Ugc29t
ZSB5ZWFycyBhZ28uCj4gPiA+Cj4gPiA+IEFueXdheSwgdGhlIGN1cnJlbnQgY29kZSBzZXRzIENP
Tl9FTkFCTEVEIGZvciBhbGwgcmVnaXN0ZXJlZAo+ID4gPiBjb25zb2xlcywgaW5jbHVkaW5nIENP
Tl9CT09UIGNvbnNvbGVzLiBUaGUgZmxhZyBpcyBjbGVhcmVkIG9ubHkKPiA+ID4gYnkgY29uc29s
ZV9zdXNwZW5kKClbKl0gb3IgdW5yZWdpc3Rlcl9jb25zb2xlKCkuCj4gPiA+Cj4gPiA+IElNSE8s
IGtnZGJvY19lYXJseWNvbl9pbml0KCkgZG9lcyBub3QgbmVlZCB0byBjYXJlIGFib3V0Cj4gPiA+
IGNvbnNvbGVfc3VzcGVuZCgpIGJlY2F1c2UgdGhlIGtlcm5lbCBjb3VsZCBub3QgYmUgc3VzcGVu
ZGVkCj4gPiA+IGR1cmluZyBib290LiBEb2VzIHRoaXMgbWFrZXMgc2Vuc2U/Cj4gPgo+ID4gWWVh
aCwgbWFrZXMgc2Vuc2UgdG8gbWUuCj4gPgo+ID4gPiBSZXN1bWU6Cj4gPiA+Cj4gPiA+IEkgd291
bGQgcmVtb3ZlIHRoZSBjaGVjayBvZiBDT05fRU5BQkxFRCBvciBDT05fU1VTUEVOREVECj4gPiA+
IGZyb20ga2dkYm9jX2Vhcmx5Y29uX2luaXQoKSBjb21wbGV0ZWx5Lgo+ID4gPgo+ID4gPiBJTUhP
LCB3ZSBzaG91bGQga2VlcCB0aGUgY2hlY2sgb2YgQ09OX0JPT1QgYmVjYXVzZSB3ZSBkbyBub3QK
PiA+ID4gd2FudCB0byByZWdpc3RlciAibm9ybWFsIiBjb25zb2xlIGRyaXZlcnMgYXMga2dkYm9j
X2Vhcmx5Y29uX2lvX29wcy4KPiA+ID4gSXQgaXMgbGF0ZXIgcmVtb3ZlZCBieSBrZ2Rib2NfZWFy
bHljb25fZGVpbml0KCkuIEkgZ3Vlc3MKPiA+ID4gdGhhdCB0aGUgY29kZSBpcyBub3QgcmVhZHkg
dG8gaGFuZGxlIGEgdGFrZW92ZXIgZnJvbSBub3JtYWwKPiA+ID4gdG8gbm9ybWFsIChldmVuIHRo
ZSBzYW1lKSBjb25zb2xlIGRyaXZlci4KPiA+Cj4gPiBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5k
IHlvdXIgbGFzdCBzZW50ZW5jZSB0aGVyZS4gSW4gZ2VuZXJhbCB0aGUKPiA+IGNvZGUgaGFuZGxp
bmcgYWxsIG9mIHRoZSBwb3NzaWJsZSBoYW5kb2ZmIChvciBsYWNrIG9mIGhhbmRvZmYpIGNhc2Vz
Cj4gPiBiZXR3ZWVuIGtnZGJvY19lYXJseWNvbiBhbmQgcmVndWxhciBrZ2Rib2MgaXMgcHJldHR5
IHdhY2t5LiBBdCBvbmUKPiA+IHBvaW50IEkgdGhvdWdodCB0aHJvdWdoIGl0IGFsbCBhbmQgdHJp
ZWQgdG8gdGVzdCBhcyBtYW55IHNjZW5hcmlvcyBhcwo+ID4gSSBjb3VsZCBhbmQgSSBzZWVtIHRv
IHJlbWVtYmVyIHRyeWluZyB0byBtb2RlbCBzb21lIG9mIHRoZSBiZWhhdmlvciBvbgo+ID4gaG93
IGVhcmx5Y29uIHdvcmtlZC4gSWYgc29tZXRoaW5nIGxvb2tzIGJyb2tlbiBoZXJlIHRoZW4gbGV0
IG1lIGtub3cuCj4KPiBMYXRlciB1cGRhdGU6IFRoZSBjb2RlIGlzIHNhZmUuIFRoZSBzY2VuYXJp
byBiZWxvdyBkb2VzIG5vdCBleGlzdCwKPiAgICAgICAgICAgICAgIHNlZSB0aGUgIldBSVQ6IiBz
ZWN0aW9uIGJlbG93Lgo+Cj4KPiBJIGFtIG5vdCBmYW1pbGlhciB3aXRoIHRoZSBrZ2RiIGluaXQg
Y29kZS4gSSB0aG91Z2h0IGFib3V0IHRoZQo+IGZvbGxvd2luZyBzY2VuYXJpbzoKPgo+IDEuIGtn
ZGJvY19lYXJseWNvbl9pbml0KCkgcmVnaXN0ZXJzIHNvbWUgc3RydWN0IGNvbnNvbGUgdmlhCj4K
PiAgICAgICAgIGtnZGJvY19lYXJseWNvbl9pb19vcHMuY29ucyA9IGNvbjsKPiAgICAgICAgIHBy
X2luZm8oIkdvaW5nIHRvIHJlZ2lzdGVyIGtnZGIgd2l0aCBlYXJseWNvbiAnJXMnXG4iLCBjb24t
Pm5hbWUpOwo+ICAgICAgICAgaWYgKGtnZGJfcmVnaXN0ZXJfaW9fbW9kdWxlKCZrZ2Rib2NfZWFy
bHljb25faW9fb3BzKSAhPSAwKSB7Cj4KPiAgICBhbmQgc2V0cwo+Cj4gICAgICAgICAgICAgICAg
IGVhcmx5Y29uX29yaWdfZXhpdCA9IGNvbi0+ZXhpdDsKPiAgICAgICAgICAgICAgICAgY29uLT5l
eGl0ID0ga2dkYm9jX2Vhcmx5Y29uX2RlZmVycmVkX2V4aXQ7Cj4KPgo+IDIuIExhdGVyLCBjb25m
aWd1cmVfa2dkYm9jKCkgd291bGQgZmluZCBzb21lICJwcmVmZXJyZWQiIGNvbnNvbGUKPiAgICBh
bmQgcmVnaXN0ZXIgaXQgdmlhCj4KPiAgICAgICAgIGZvcl9lYWNoX2NvbnNvbGVfc3JjdShjb25z
KSB7Cj4gICAgICAgICAgICAgICAgIGludCBpZHg7Cj4gICAgICAgICAgICAgICAgIGlmIChjb25z
LT5kZXZpY2UgJiYgY29ucy0+ZGV2aWNlKGNvbnMsICZpZHgpID09IHAgJiYKPiAgICAgICAgICAg
ICAgICAgICAgIGlkeCA9PSB0dHlfbGluZSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGtn
ZGJvY19pb19vcHMuY29ucyA9IGNvbnM7Cj4gWy4uLl0KPiAgICAgICAgIGVyciA9IGtnZGJfcmVn
aXN0ZXJfaW9fbW9kdWxlKCZrZ2Rib2NfaW9fb3BzKTsKPgo+ICAgICwgd2hlcmUga2dkYl9yZWdp
c3Rlcl9pb19tb2R1bGUgd291bGQgY2FsbCBkZWluaXQgZm9yIHRoZQo+ICAgIHByZXZpb3VzbHkg
cmVnaXN0ZXJlZCBrZ2Rib2NfZWFybHljb25faW9fb3BzOgo+Cj4gICAgICAgICBpZiAob2xkX2Ri
Z19pb19vcHMpIHsKPiAgICAgICAgICAgICAgICAgb2xkX2RiZ19pb19vcHMtPmRlaW5pdCgpOwo+
ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgIH0KPgo+ICAgICwgd2hlcmUga2dk
Ym9jX2Vhcmx5Y29uX2RlaW5pdCgpIG1pZ2h0IGNhbGwgdGhlIC5leGl0KCkgY2FsbGJhY2sKPgo+
ICAgICAgICAgICAgICAgICBrZ2Rib2NfZWFybHljb25faW9fb3BzLmNvbnMtPmV4aXQoa2dkYm9j
X2Vhcmx5Y29uX2lvX29wcy5jb25zKTsKPgo+Cj4gQkFORzogSWYgYm90aCAia2dkYm9jX2Vhcmx5
Y29uX2lvX29wcyIgYW5kICJrZ2Rib2NfaW9fb3BzIiBwb2ludGVkIHRvCj4gICAgICAgdGhlIHNh
bWUgc3RydWN0IGNvbnNvbGUgdGhlbiB0aGlzIG1pZ2h0IGNhbGwgLmV4aXQoKSBjYWxsYmFjawo+
ICAgICAgIGZvciBhIGNvbnNvbGUgd2hpY2ggaXMgc3RpbGwgYmVpbmcgdXNlZC4KPgo+ICAgICAg
IEJ1dCBJIGFtIHdyb25nLCBzZWUgYmVsb3cuCj4KPiBXQUlUOgo+Cj4gSSBoYXZlIGdvdCBhbGwg
dGhlIHBpZWNlcyB0b2dldGhlciB3aGVuIHdyaXRpbmcgdGhpcyBtYWlsKS4KPiBJIHNlZSB0aGF0
IHRoZSBjb2RlIGlzIHNhZmUsIG5hbWVseToKPgo+IHN0YXRpYyB2b2lkIGtnZGJvY19lYXJseWNv
bl9kZWluaXQodm9pZCkKPiB7Cj4gICAgICAgICBpZiAoIWtnZGJvY19lYXJseWNvbl9pb19vcHMu
Y29ucykKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gICAgICAgICBpZiAoa2dkYm9jX2Vh
cmx5Y29uX2lvX29wcy5jb25zLT5leGl0ID09IGtnZGJvY19lYXJseWNvbl9kZWZlcnJlZF9leGl0
KQo+ICAgICAgICAgICAgICAgICAvKgo+ICAgICAgICAgICAgICAgICAgKiBrZ2Rib2NfZWFybHlj
b24gaXMgZXhpdGluZyBidXQgb3JpZ2luYWwgYm9vdCBjb25zb2xlIGV4aXQKPiAgICAgICAgICAg
ICAgICAgICogd2FzIG5ldmVyIGNhbGxlZCAoQUtBIGtnZGJvY19lYXJseWNvbl9kZWZlcnJlZF9l
eGl0KCkKPiAgICAgICAgICAgICAgICAgICogZGlkbid0IGV2ZXIgcnVuKS4gIFVuZG8gb3VyIHRy
YXAuCj4gICAgICAgICAgICAgICAgICAqLwo+ICAgICAgICAgICAgICAgICBrZ2Rib2NfZWFybHlj
b25faW9fb3BzLmNvbnMtPmV4aXQgPSBlYXJseWNvbl9vcmlnX2V4aXQ7Cj4gICAgICAgICBlbHNl
IGlmIChrZ2Rib2NfZWFybHljb25faW9fb3BzLmNvbnMtPmV4aXQpCj4gICAgICAgICAgICAgICAg
IC8qCj4gICAgICAgICAgICAgICAgICAqIFdlIHNraXBwZWQgY2FsbGluZyB0aGUgZXhpdCgpIHJv
dXRpbmUgc28gd2UgY291bGQgdHJ5IHRvCj4gICAgICAgICAgICAgICAgICAqIGtlZXAgdXNpbmcg
dGhlIGJvb3QgY29uc29sZSBldmVuIGFmdGVyIGl0IHdlbnQgYXdheS4gIFdlJ3JlCj4gICAgICAg
ICAgICAgICAgICAqIGZpbmFsbHkgZG9uZSBzbyBjYWxsIHRoZSBmdW5jdGlvbiBub3cuCj4gICAg
ICAgICAgICAgICAgICAqLwo+ICAgICAgICAgICAgICAgICBrZ2Rib2NfZWFybHljb25faW9fb3Bz
LmNvbnMtPmV4aXQoa2dkYm9jX2Vhcmx5Y29uX2lvX29wcy5jb25zKTsKPgo+ICAgICAgICAga2dk
Ym9jX2Vhcmx5Y29uX2lvX29wcy5jb25zID0gTlVMTDsKPiB9Cj4KPiBJdCBjYWxscyBrZ2Rib2Nf
ZWFybHljb25faW9fb3BzLmNvbnMtPmV4aXQoKSBvbmx5IHdoZW4KPiB1bnJlZ2lzdGVyX2NvbnNv
bGUoKSB0cmllZCB0byBjYWxsIHRoZSBvcmlnaW5hbCBjb24tPmV4aXQoKQo+IHdoaWNoIHdhcyBy
ZWFzc2lnbmVkIHRvIGtnZGJvY19lYXJseWNvbl9kZWZlcnJlZF9leGl0KCkuLi4KPgo+IFVwZGF0
ZWQgcmVzdW1lOgo+Cj4gSXQgbG9va3MgdG8gbWUgdGhhdCBldmVuIG5vcm1hbCBjb25zb2xlIGNh
biBiZSB1c2VkIGJ5Cj4ga2dkYm9jX2Vhcmx5Y29uX2lvX29wcyBhbmQgd2UgY291bGQgcmVtb3Zl
IGV2ZW4gdGhlIGNoZWNrCj4gb2YgdGhlIENPTl9CT09UIGZsYWcuCj4KPiBNeSBleHBlY3RhdGlv
bjoKPgo+IElmIGEgInN0cnVjdCBjb25zb2xlIiBpcyByZWdpc3RlcmVkIHRoZW4gdGhlIGRyaXZl
ciBpcyB1c2VkCj4gYnkgcHJpbnRrKCkgYW5kIGl0IHNob3VsZCBiZSBzYWZlIGV2ZW4gZm9yIGtn
ZGJvY19lYXJseWNvbiwKPiBhcyBsb25nIGFzIGl0IGhhcyBib3RoICJjb24tPndyaXRlIiBhbmQg
ImNvbi0+cmVhZCIgY2FsbGJhY2tzLgo+Cj4gU28gdGhlIGNoZWNrIGluIGtnZGJvY19lYXJseWNv
bl9pbml0KCkgbWlnaHQgYmU6Cj4KPiAgICAgICAgIGZvcl9lYWNoX2NvbnNvbGUoY29uKSB7Cj4g
ICAgICAgICAgICAgICAgIGlmIChjb24tPndyaXRlICYmIGNvbi0+cmVhZCAmJgo+ICAgICAgICAg
ICAgICAgICAgICAgKCFvcHQgfHwgIW9wdFswXSB8fCBzdHJjbXAoY29uLT5uYW1lLCBvcHQpID09
IDApKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgfQo+Cj4gSGVo
LCBJIGhvcGUgdGhhdCB5b3Ugd2VyZSBhYmxlIHRvIGZvbGxvdyBteSB0aG91Z2h0cyBhbmQgSSBk
aWQgbm90Cj4gY3JlYXRlIGV2ZW4gYmlnZ2VyIGNvbmZ1c2lvbi4KCkkgZGlkbid0IGdvIGJhY2sg
dG8gdGhlIGNvZGUgYW5kIHRyYWNlIHRocm91Z2ggZXZlcnkgc3RlcCB5b3UgbWFkZSwKYnV0IGl0
IHNvdW5kcyBsaWtlIHRoZSBjb2RlIGxvb2tzIE9LIGV2ZW4gaWYgaXQncyBhIGJpdCBjb252b2x1
dGVkCihzb3JyeSBhYm91dCB0aGF0ISBhdCBsZWFzdCBpdCdzIGNvbW1lbnRlZCEpLgoKSSBhZ3Jl
ZSB3aXRoIHlvdXIgZmluYWwgc3VnZ2VzdGlvbiBmb3IgdGhlIGNoZWNrLiBUaGF0IGhhcyB0aGUg
c2lkZQplZmZlY3Qgb2YgYWxzbyBiZWluZyBsZXNzIG9mIGEgY2hhbmdlIGZyb20gd2hhdCB3ZSBo
YWQgYmVmb3JlLiBCZWNhdXNlCm9mIGhvdyB0aGUgY29kZSB3YXMgd3JpdHRlbiBiZWZvcmUsIGl0
IHdvdWxkIGhhdmUgYWxsb3dlZCBhbnkgY29uc29sZQpiZWNhdXNlIGl0IGNoZWNrZWQgZm9yICJl
bmFibGVkIG9yIGJvb3QiIGFuZCBhbGwgY29uc29sZXMgd2VyZQplbmFibGVkLiBTbyBqdXN0IGdl
dHRpbmcgcmlkIG9mIHRoZSBjaGVjayBmb3IgZmxhZ3Mgc2VlbXMgcmVhc29uYWJsZQp0byBtZS4K
Ci1Eb3VnCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
S2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2Ri
LWJ1Z3JlcG9ydAo=
