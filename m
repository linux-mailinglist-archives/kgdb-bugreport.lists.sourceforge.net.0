Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC3F788B7E
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 25 Aug 2023 16:19:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qZXeX-0004JP-7Q
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 25 Aug 2023 14:19:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qZXeV-0004JI-9q
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:19:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=14tHzTgrKzLolOWDMGY+nCkYOzM5n5tEd4Wo+rV44J4=; b=QH9iAx84TUKDeT2KXMsw/xr1jo
 pZNpwmTnNa+XEfELrvFPYSbuRtzQHqwqKEvC6oooTCJ9rK0zztugCWio8Y2AZcv2FzCnLU3lCAvMH
 SFKaL3t0tFXHQBq4blZn6uufCCHvJtZZDGhZLauIPSfx9AFZRX1ZoQnTaS0JQO1Aax/8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=14tHzTgrKzLolOWDMGY+nCkYOzM5n5tEd4Wo+rV44J4=; b=OWg7GbqE/TqCtL6+i2L9BYfLHV
 ncJS7sGdCuJs8Q1X8u0A/A0A1fKLVfLFPUKnE0uihrFge4ivtpJC8STUbSy7RcEb47AwebnCElAnR
 ZulvFfHWcmlJp5/NPtOO7qN7WIJN5hr2Fey9LogbPjeSsXP1AAos7qqYfEM9fR+y/rOE=;
Received: from mail-lj1-f169.google.com ([209.85.208.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZXeU-0008Hl-Ee for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:19:07 +0000
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2bcbfb3705dso14714321fa.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Aug 2023 07:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692973138; x=1693577938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=14tHzTgrKzLolOWDMGY+nCkYOzM5n5tEd4Wo+rV44J4=;
 b=MF0OMSPGIySS9zP3ABU4L/NnYnceWDKSfjyO+TT343VEDc8Q9ykUdhfSnaruPikSyC
 5OAU50vCUUb128qjmXPUEuc4+EXr+dza6k+Q82jsOthzFkM0wT03DZ4Gag+efm+cAP3i
 tisffPNiWGsZjHgh3EB7bciG6WXWt1fNrqS1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692973138; x=1693577938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=14tHzTgrKzLolOWDMGY+nCkYOzM5n5tEd4Wo+rV44J4=;
 b=jHQdOzPCza4kqSrIkpHBpNiooJvwWf+AUCavdpi/o6c4pw75LnRn23/wsSai2cT6Zg
 9FjgL2QoCZYPowFpIjCmaodCFoQWy12ggceL0FqhELr7BocSagQ+RRMe2Haj8qFNGaUU
 qZUP9O1tjXAqbIlH8Iz5wq2TnbpMeqthyShUZi3zE2C79siKVIgeqH39hKiJ4gpQetJm
 5yxA/+62rd7KpBZwE6IHk6nsYuiCctyXg7g/0OAE3Deoh+bum5hfP05MXEH8qenzn2xv
 Ca586WbacqmUoz4XSN3t6vkZI4+YQBc9MUJ3Zwdja8LSkor9G8YY4hHLAGG+Q3PXvE4F
 YFrQ==
X-Gm-Message-State: AOJu0YyvUl17YiRcQWAwa6KLFBC4DAOMYVSnyR3qDT48cJv14YkTcXyc
 BbqFg5wIgWjEf1LKDR6CIOODXdJ2Tnu/LGu+owtlE8MC
X-Google-Smtp-Source: AGHT+IHL4j7CLN9Lk/IIaJie9pHJnJMePkyPg71QLe2olfa7Bl43EtcoI8MrTq7AlSK9YvLj2lU3mw==
X-Received: by 2002:a2e:99c4:0:b0:2bc:e856:6208 with SMTP id
 l4-20020a2e99c4000000b002bce8566208mr3629129ljj.33.1692973137467; 
 Fri, 25 Aug 2023 07:18:57 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 c11-20020a170906924b00b0099297c99314sm1008501ejx.113.2023.08.25.07.18.56
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Aug 2023 07:18:56 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-3fef2fafee2so101005e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Aug 2023 07:18:56 -0700 (PDT)
X-Received: by 2002:a05:600c:1d98:b0:401:a494:2bbb with SMTP id
 p24-20020a05600c1d9800b00401a4942bbbmr173381wms.5.1692973136430; Fri, 25 Aug
 2023 07:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230822131945.1.I5b460ae8f954e4c4f628a373d6e74713c06dd26f@changeid>
 <20230825100854.GC270740@aspen.lan>
In-Reply-To: <20230825100854.GC270740@aspen.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Aug 2023 07:18:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VHa1arysMgqZcGFGFi2N8i0BeKWD6BM8dSsg0Xq2LUFQ@mail.gmail.com>
Message-ID: <CAD=FV=VHa1arysMgqZcGFGFi2N8i0BeKWD6BM8dSsg0Xq2LUFQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Fri, Aug 25, 2023 at 3:09 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > On Tue, Aug 22, 2023 at 01:19:46PM -0700, Douglas Anderson wrote:
    > > When entering kdb/kgdb on a kernel panic [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.169 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.169 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qZXeU-0008Hl-Ee
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Flush console before entering
 kgdb on panic
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
Cc: kgdb-bugreport@lists.sourceforge.net, Petr Mladek <pmladek@suse.com>,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBGcmksIEF1ZyAyNSwgMjAyMyBhdCAzOjA54oCvQU0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEF1ZyAyMiwgMjAy
MyBhdCAwMToxOTo0NlBNIC0wNzAwLCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+ID4gV2hlbiBl
bnRlcmluZyBrZGIva2dkYiBvbiBhIGtlcm5lbCBwYW5pYywgaXQgd2FzIGJlIG9ic2VydmVkIHRo
YXQgdGhlCj4gPiBjb25zb2xlIGlzbid0IGZsdXNoZWQgYmVmb3JlIHRoZSBga2RiYCBwcm9tcHQg
Y2FtZSB1cC4gU3BlY2lmaWNhbGx5LAo+ID4gd2hlbiB1c2luZyB0aGUgYnVkZHkgbG9ja3VwIGRl
dGVjdG9yIG9uIGFybTY0IGFuZCBydW5uaW5nOgo+ID4gICBlY2hvIEhBUkRMT0NLVVAgPiAvc3lz
L2tlcm5lbC9kZWJ1Zy9wcm92b2tlLWNyYXNoL0RJUkVDVAo+ID4KPiA+IEkgY291bGQgc2VlOgo+
ID4gICBbICAgMjYuMTYxMDk5XSBsa2R0bTogUGVyZm9ybWluZyBkaXJlY3QgZW50cnkgSEFSRExP
Q0tVUAo+ID4gICBbICAgMzIuNDk5ODgxXSB3YXRjaGRvZzogV2F0Y2hkb2cgZGV0ZWN0ZWQgaGFy
ZCBMT0NLVVAgb24gY3B1IDYKPiA+ICAgWyAgIDMyLjU1Mjg2NV0gU2VuZGluZyBOTUkgZnJvbSBD
UFUgNSB0byBDUFVzIDY6Cj4gPiAgIFsgICAzMi41NTczNTldIE5NSSBiYWNrdHJhY2UgZm9yIGNw
dSA2Cj4gPiAgIC4uLiBbYmFja3RyYWNlIGZvciBjcHUgNl0gLi4uCj4gPiAgIFsgICAzMi41NTgz
NTNdIE5NSSBiYWNrdHJhY2UgZm9yIGNwdSA1Cj4gPiAgIC4uLiBbYmFja3RyYWNlIGZvciBjcHUg
NV0gLi4uCj4gPiAgIFsgICAzMi44Njc0NzFdIFNlbmRpbmcgTk1JIGZyb20gQ1BVIDUgdG8gQ1BV
cyAwLTQsNzoKPiA+ICAgWyAgIDMyLjg3MjMyMV0gTk1JIGJhY2t0cmFjZSBmb3JQIGNwdUFOQzog
SGFyZCBMT0NLVVAKPiA+Cj4gPiAgIEVudGVyaW5nIGtkYiAoY3VycmVudD0uLi4sIHBpZCAwKSBv
biBwcm9jZXNzb3IgNSBkdWUgdG8gS2V5Ym9hcmQgRW50cnkKPiA+ICAgWzVda2RiPgo+ID4KPiA+
IEFzIHlvdSBjYW4gc2VlLCBiYWNrdHJhY2VzIGZvciB0aGUgb3RoZXIgQ1BVcyBzdGFydCBwcmlu
dGluZyBhbmQgZ2V0Cj4gPiBpbnRlcmxlYXZlZCB3aXRoIHRoZSBrZGIgUEFOSUMgcHJpbnQuCj4g
Pgo+ID4gTGV0J3MgcmVwbGljYXRlIHRoZSBjb21tYW5kcyB0byBmbHVzaCB0aGUgY29uc29sZSBp
biB0aGUga2RiIHBhbmljCj4gPiBlbnRyeSBwb2ludCB0byBhdm9pZCB0aGlzLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KPiA+
IC0tLQo+ID4KPiA+ICBrZXJuZWwvZGVidWcvZGVidWdfY29yZS5jIHwgMyArKysKPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2tlcm5lbC9k
ZWJ1Zy9kZWJ1Z19jb3JlLmMgYi9rZXJuZWwvZGVidWcvZGVidWdfY29yZS5jCj4gPiBpbmRleCBk
NWU5Y2NkZTNhYjguLjNhOTA0ZDg2OTdjOCAxMDA2NDQKPiA+IC0tLSBhL2tlcm5lbC9kZWJ1Zy9k
ZWJ1Z19jb3JlLmMKPiA+ICsrKyBiL2tlcm5lbC9kZWJ1Zy9kZWJ1Z19jb3JlLmMKPiA+IEBAIC0x
MDA2LDYgKzEwMDYsOSBAQCB2b2lkIGtnZGJfcGFuaWMoY29uc3QgY2hhciAqbXNnKQo+ID4gICAg
ICAgaWYgKHBhbmljX3RpbWVvdXQpCj4gPiAgICAgICAgICAgICAgIHJldHVybjsKPiA+Cj4gPiAr
ICAgICBkZWJ1Z19sb2Nrc19vZmYoKTsKPiA+ICsgICAgIGNvbnNvbGVfZmx1c2hfb25fcGFuaWMo
Q09OU09MRV9GTFVTSF9QRU5ESU5HKTsKPiA+ICsKPiA+ICAgICAgIGlmIChkYmdfa2RiX21vZGUp
Cj4gPiAgICAgICAgICAgICAgIGtkYl9wcmludGYoIlBBTklDOiAlc1xuIiwgbXNnKTsKPgo+IEkn
bSBzb21ld2hhdCBpbmNsdWRlZCB0byBzYXkgKnRoaXMqIChjYWxsaW5nIGtkYl9wcmludGYoKSB3
aGVuIG5vdAo+IGFjdHVhbGx5IGluIHRoZSBkZWJ1Z2dlcikgaXMgdGhlIGNhdXNlIG9mIHRoZSBw
cm9ibGVtLiBrZGJfcHJpbnRmKCkKPiBkb2VzIHNvbWUgcHJldHR5IGhvcmlkIHRoaW5ncyB0byB0
aGUgY29uc29sZSBhbmQgaXNuJ3QgaW50ZW5kZWQgdG8KPiBydW4gd2hpbGUgdGhlIHN5c3RlbSBp
cyBhY3RpdmUuCj4KPiBJJ2QgdGhlcmVmb3JlIGJlIG1vcmUgdGVtcHRlZCB0byBkZWZlciB0aGUg
cHJpbnQgdG8gdGhlIGIucC4gdHJhcAo+IGhhbmRsZXIgaXRzZWxmIGFuZCBtYWtlIHRoaXMgcGFy
dCBvZiBrZ2RiX3BhbmljKCkgbG9vayBtb3JlIGxpa2U6Cj4KPiAgICAgICAgIGtnZGJfcGFuaWNf
bXNnID0gbXNnOwo+ICAgICAgICAga2dkYl9icmVha3BvaW50KCk7Cj4gICAgICAgICBrZ2RiX3Bh
bmljX21zZyA9IE5VTEw7CgpVbmZvcnR1bmF0ZWx5IEkgdGhpbmsgdGhhdCBvbmx5IHNvbHZlcyBo
YWxmIHRoZSBwcm9ibGVtLiBBcyBhIHF1aWNrCnRlc3QsIEkgdHJpZWQgc2ltcGx5IGNvbW1lbnRp
bmcgb3V0IHRoZSAia2RiX3ByaW50ZiIgbGluZSBpbgprZ2RiX3BhbmljKCkuIFdoaWxlIHRoYXQg
YXZvaWRzIHRoZSBpbnRlcmxlYXZlZCBwYW5pYyBtZXNzYWdlIGFuZApiYWNrdHJhY2UsIGl0IGRv
ZXMgbm90aGluZyB0byBhY3R1YWxseSBnZXQgdGhlIGJhY2t0cmFjZXMgcHJpbnRlZCBvdXQKYmVm
b3JlIHlvdSBlbmQgdXAgaW4ga2RiLiBBcyBhbiBleGFtcGxlLCB0aGlzIGlzIHdoYXQgaGFwcGVu
ZWQgd2hlbiBJCnVzZWQgYGVjaG8gSEFSRExPQ0tVUCA+IC9zeXMva2VybmVsL2RlYnVnL3Byb3Zv
a2UtY3Jhc2gvRElSRUNUYCBhbmQKaGFkIHRoZSAia2RiX3ByaW50ZiIgaW4ga2dkYl9wYW5pYygp
IGNvbW1lbnRlZCBvdXQ6CgpbICAgNzIuNjU4NDI0XSBsa2R0bTogUGVyZm9ybWluZyBkaXJlY3Qg
ZW50cnkgSEFSRExPQ0tVUApbICAgODIuMTgxODU3XSB3YXRjaGRvZzogV2F0Y2hkb2cgZGV0ZWN0
ZWQgaGFyZCBMT0NLVVAgb24gY3B1IDYKLi4uClsgICA4Mi4yMzQ4MDFdIFNlbmRpbmcgTk1JIGZy
b20gQ1BVIDUgdG8gQ1BVcyA2OgpbICAgODIuMjM5Mjk2XSBOTUkgYmFja3RyYWNlIGZvciBjcHUg
NgouLi4gWyBzdGFjayB0cmFjZSBmb3IgQ1BVIDYgXSAuLi4KWyAgIDgyLjI0MDI5NF0gTk1JIGJh
Y2t0cmFjZSBmb3IgY3B1IDUKLi4uIFsgc3RhY2sgdHJhY2UgZm9yIENQVSA1IF0gLi4uClsgICA4
Mi41NzY0NDNdIFNlbmRpbmcgTk1JIGZyb20gQ1BVIDUgdG8gQ1BVcyAwLTQsNzoKWyAgIDgyLjU4
MTI5MV0gTk1JIGJhY2t0cmFjZQpFbnRlcmluZyBrZGIgKGN1cnJlbnQ9MHhmZmZmZmY4MGRhNWEx
MDgwLCBwaWQgNjk3OCkgb24gcHJvY2Vzc29yIDUgZHVlCnRvIEtleWJvYXJkIEVudHJ5Cls1XWtk
Yj4KCkFzIHlvdSBjYW4gc2VlLCBJIGRvbid0IHNlZSB0aGUgdHJhY2VzIGZvciBDUFVzIDAtNCBh
bmQgNy4gVGhvc2UgZG8Kc2hvdyB1cCBpZiBJIHVzZSB0aGUgImRtZXNnIiBjb21tYW5kIGJ1dCBp
dCdzIGEgYml0IG9mIGEgaGFzc2xlIHRvIHJ1bgoiZG1lc2ciIHRvIGxvb2sgZm9yIGFueSBleHRy
YSBkZWJ1ZyBtZXNzYWdlcyBldmVyeSB0aW1lIEkgZHJvcCBpbiBrZGIuCgpJIGd1ZXNzIHBlcmhh
cHMgdGhhdCBwYXJ0IGlzbid0IG9idmlvdXMgZnJvbSB0aGUgY29tbWl0IG1lc3NhZ2U/ClNob3Vs
ZCBJIHNlbmQgYSBuZXcgdmVyc2lvbiB3aXRoIGFuIHVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UgaW5k
aWNhdGluZwp0aGF0IGl0J3Mgbm90IGp1c3QgdGhlIGp1bWJsZWQgdGV4dCB0aGF0J3MgYSBwcm9i
bGVtIGJ1dCBhbHNvIHRoZSBsYWNrCm9mIHN0YWNrIHRyYWNlcz8KClRoYW5rcyEKCi1Eb3VnCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdy
ZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9y
dAo=
