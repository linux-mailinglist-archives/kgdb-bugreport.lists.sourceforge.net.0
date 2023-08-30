Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C45BD78D4F6
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 30 Aug 2023 11:54:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qbHtw-0001WY-4v
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 30 Aug 2023 09:54:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1qbHtu-0001WR-Hp
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 30 Aug 2023 09:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TQrf16cg+NiqdMGdtFVNJcxqedj4vde246HAhKjb6+Y=; b=QcWMjapK6ySg34fvZ4T1r84o55
 xA8chMxlmHshGjzZEweSVXa35+v7JTJLFEYBlRC9zwDBHgMK5PN2mewbechMBMbJgw0mZvIRKJIOD
 8btdA/iwvx4EVaVAkj6jrcxd1FPZc9Nc9qs5wrQLGH3xaV6SQvAmGLjwAXF29Q5W+rD8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TQrf16cg+NiqdMGdtFVNJcxqedj4vde246HAhKjb6+Y=; b=Xj9ji+jhukakGHYPgr/Yr9S3vq
 FPZBSTyFw5miJGzU+5pdN8xQbgOtpPte1kpENkhWgecQPi2Byg0aIkxxq1O0kICDLT9sfxCa/Z3hL
 c0Y/n+7OHyOPR2sTDQNaSazPczpD3OfoVQN2S1snLz39F5EDgNVPl6WP3ptU8ykp0I8Q=;
Received: from mail-wm1-f48.google.com ([209.85.128.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qbHtn-003P7j-Rn for kgdb-bugreport@lists.sourceforge.net;
 Wed, 30 Aug 2023 09:54:14 +0000
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-401d80f4ef8so14569415e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 30 Aug 2023 02:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693389241; x=1693994041; darn=lists.sourceforge.net;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TQrf16cg+NiqdMGdtFVNJcxqedj4vde246HAhKjb6+Y=;
 b=gwWVPwForjaqc8ja1uge3DHdq14ujALHRqSXiJk7ZIcegKMXWsc5bKpx0Rf6QSOoES
 h4ocWyYdQFhgid1KzSifyplREobS2LuVMJyuDo+1U+Rpkz+qliBuJbz/UiSB+M+17HKw
 i/0M3a2BX6XiPieQoVQl5PvKJFoCA6snXWA7O3VEykBlMFGfr5nHBzTKuLeoDYPU3fKa
 LL9rTcU/VkeNVpV1Nv95W0FvZdI6pOBwsvm8p1YhVmWjS/fyCnbP8j8vpSU0/pg5QeTs
 8QfP4qqvOiL1DlmbPGqQ+98y0620ppGJZwcTQYs0zWLXjx/WKNACzUE57vS2IcURzqek
 XWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693389241; x=1693994041;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TQrf16cg+NiqdMGdtFVNJcxqedj4vde246HAhKjb6+Y=;
 b=INQMGKy2f6o5NYacgtFbfLUzKA98xjeK5qRfjVaQNJzjho02B2h9ztYvBOmpDNtqzj
 j8z/xqlaCtHsV8G6QKQlgs9dm/v1kDPeAFQtCg7pH/N8YxrBKPyND6khZhIEJW4Luw1t
 n+jMbJ3n4QwV1YLfTB73QsS+iCVACcPPJVFyJcrFb44hvaN0z+8h0GiBjiXz1NOPYSKB
 qFXomxzWAGkMBxQxuqYLgfLTjLTtgpo+mAVBO4DPv9IG0KQQOfKBXGxmy94X8iSQZ7JJ
 G0phJMBp2S4KxYwKVcdDkiFAtJY1Q63DySSz2jXPyVB4d/UoAB/MZt+ChhlsOPbgQj7k
 wd2g==
X-Gm-Message-State: AOJu0YzKM9/66EjBQJ7VxN40eM/Yf2iE7TX/s1WBXh7iMBEomW4BBSCi
 hJNL9Zt7Hi4BBaaoOHxzDFRbzQ==
X-Google-Smtp-Source: AGHT+IH+QX2uRpED63uPhWYhweJ0cWpNkPglQheXInf45HGQ9LkmLBDlmGod1hs8yCfFV8wKBunKpQ==
X-Received: by 2002:a05:600c:b57:b0:401:73b2:f039 with SMTP id
 k23-20020a05600c0b5700b0040173b2f039mr1530156wmr.7.1693389241342; 
 Wed, 30 Aug 2023 02:54:01 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a1c4c17000000b00401d8181f8bsm1729781wmf.25.2023.08.30.02.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 02:54:00 -0700 (PDT)
Date: Wed, 30 Aug 2023 10:53:59 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20230830095359.GA44243@aspen.lan>
References: <20230822131945.1.I5b460ae8f954e4c4f628a373d6e74713c06dd26f@changeid>
 <20230825100854.GC270740@aspen.lan>
 <CAD=FV=VHa1arysMgqZcGFGFi2N8i0BeKWD6BM8dSsg0Xq2LUFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=VHa1arysMgqZcGFGFi2N8i0BeKWD6BM8dSsg0Xq2LUFQ@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Aug 25, 2023 at 07:18:44AM -0700, Doug Anderson wrote:
    > Hi, > > On Fri, Aug 25, 2023 at 3:09 AM Daniel Thompson > <daniel.thompson@linaro.org>
    wrote: > > > > On Tue, Aug 22, 2023 at 01:19:4 [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.48 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.48 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1qbHtn-003P7j-Rn
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

T24gRnJpLCBBdWcgMjUsIDIwMjMgYXQgMDc6MTg6NDRBTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKPgo+IE9uIEZyaSwgQXVnIDI1LCAyMDIzIGF0IDM6MDnigK9BTSBEYW5pZWwg
VGhvbXBzb24KPiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+IE9u
IFR1ZSwgQXVnIDIyLCAyMDIzIGF0IDAxOjE5OjQ2UE0gLTA3MDAsIERvdWdsYXMgQW5kZXJzb24g
d3JvdGU6Cj4gPiA+IFdoZW4gZW50ZXJpbmcga2RiL2tnZGIgb24gYSBrZXJuZWwgcGFuaWMsIGl0
IHdhcyBiZSBvYnNlcnZlZCB0aGF0IHRoZQo+ID4gPiBjb25zb2xlIGlzbid0IGZsdXNoZWQgYmVm
b3JlIHRoZSBga2RiYCBwcm9tcHQgY2FtZSB1cC4gU3BlY2lmaWNhbGx5LAo+ID4gPiB3aGVuIHVz
aW5nIHRoZSBidWRkeSBsb2NrdXAgZGV0ZWN0b3Igb24gYXJtNjQgYW5kIHJ1bm5pbmc6Cj4gPiA+
ICAgZWNobyBIQVJETE9DS1VQID4gL3N5cy9rZXJuZWwvZGVidWcvcHJvdm9rZS1jcmFzaC9ESVJF
Q1QKPiA+ID4KPiA+ID4gSSBjb3VsZCBzZWU6Cj4gPiA+ICAgWyAgIDI2LjE2MTA5OV0gbGtkdG06
IFBlcmZvcm1pbmcgZGlyZWN0IGVudHJ5IEhBUkRMT0NLVVAKPiA+ID4gICBbICAgMzIuNDk5ODgx
XSB3YXRjaGRvZzogV2F0Y2hkb2cgZGV0ZWN0ZWQgaGFyZCBMT0NLVVAgb24gY3B1IDYKPiA+ID4g
ICBbICAgMzIuNTUyODY1XSBTZW5kaW5nIE5NSSBmcm9tIENQVSA1IHRvIENQVXMgNjoKPiA+ID4g
ICBbICAgMzIuNTU3MzU5XSBOTUkgYmFja3RyYWNlIGZvciBjcHUgNgo+ID4gPiAgIC4uLiBbYmFj
a3RyYWNlIGZvciBjcHUgNl0gLi4uCj4gPiA+ICAgWyAgIDMyLjU1ODM1M10gTk1JIGJhY2t0cmFj
ZSBmb3IgY3B1IDUKPiA+ID4gICAuLi4gW2JhY2t0cmFjZSBmb3IgY3B1IDVdIC4uLgo+ID4gPiAg
IFsgICAzMi44Njc0NzFdIFNlbmRpbmcgTk1JIGZyb20gQ1BVIDUgdG8gQ1BVcyAwLTQsNzoKPiA+
ID4gICBbICAgMzIuODcyMzIxXSBOTUkgYmFja3RyYWNlIGZvclAgY3B1QU5DOiBIYXJkIExPQ0tV
UAo+ID4gPgo+ID4gPiAgIEVudGVyaW5nIGtkYiAoY3VycmVudD0uLi4sIHBpZCAwKSBvbiBwcm9j
ZXNzb3IgNSBkdWUgdG8gS2V5Ym9hcmQgRW50cnkKPiA+ID4gICBbNV1rZGI+Cj4gPiA+Cj4gPiA+
IEFzIHlvdSBjYW4gc2VlLCBiYWNrdHJhY2VzIGZvciB0aGUgb3RoZXIgQ1BVcyBzdGFydCBwcmlu
dGluZyBhbmQgZ2V0Cj4gPiA+IGludGVybGVhdmVkIHdpdGggdGhlIGtkYiBQQU5JQyBwcmludC4K
PiA+ID4KPiA+ID4gTGV0J3MgcmVwbGljYXRlIHRoZSBjb21tYW5kcyB0byBmbHVzaCB0aGUgY29u
c29sZSBpbiB0aGUga2RiIHBhbmljCj4gPiA+IGVudHJ5IHBvaW50IHRvIGF2b2lkIHRoaXMuCj4g
PiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9t
aXVtLm9yZz4KPiA+ID4gLS0tCj4gPiA+Cj4gPiA+ICBrZXJuZWwvZGVidWcvZGVidWdfY29yZS5j
IHwgMyArKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+ID4KPiA+
ID4gZGlmZiAtLWdpdCBhL2tlcm5lbC9kZWJ1Zy9kZWJ1Z19jb3JlLmMgYi9rZXJuZWwvZGVidWcv
ZGVidWdfY29yZS5jCj4gPiA+IGluZGV4IGQ1ZTljY2RlM2FiOC4uM2E5MDRkODY5N2M4IDEwMDY0
NAo+ID4gPiAtLS0gYS9rZXJuZWwvZGVidWcvZGVidWdfY29yZS5jCj4gPiA+ICsrKyBiL2tlcm5l
bC9kZWJ1Zy9kZWJ1Z19jb3JlLmMKPiA+ID4gQEAgLTEwMDYsNiArMTAwNiw5IEBAIHZvaWQga2dk
Yl9wYW5pYyhjb25zdCBjaGFyICptc2cpCj4gPiA+ICAgICAgIGlmIChwYW5pY190aW1lb3V0KQo+
ID4gPiAgICAgICAgICAgICAgIHJldHVybjsKPiA+ID4KPiA+ID4gKyAgICAgZGVidWdfbG9ja3Nf
b2ZmKCk7Cj4gPiA+ICsgICAgIGNvbnNvbGVfZmx1c2hfb25fcGFuaWMoQ09OU09MRV9GTFVTSF9Q
RU5ESU5HKTsKPiA+ID4gKwo+ID4gPiAgICAgICBpZiAoZGJnX2tkYl9tb2RlKQo+ID4gPiAgICAg
ICAgICAgICAgIGtkYl9wcmludGYoIlBBTklDOiAlc1xuIiwgbXNnKTsKPiA+Cj4gPiBJJ20gc29t
ZXdoYXQgaW5jbHVkZWQgdG8gc2F5ICp0aGlzKiAoY2FsbGluZyBrZGJfcHJpbnRmKCkgd2hlbiBu
b3QKPiA+IGFjdHVhbGx5IGluIHRoZSBkZWJ1Z2dlcikgaXMgdGhlIGNhdXNlIG9mIHRoZSBwcm9i
bGVtLiBrZGJfcHJpbnRmKCkKPiA+IGRvZXMgc29tZSBwcmV0dHkgaG9yaWQgdGhpbmdzIHRvIHRo
ZSBjb25zb2xlIGFuZCBpc24ndCBpbnRlbmRlZCB0bwo+ID4gcnVuIHdoaWxlIHRoZSBzeXN0ZW0g
aXMgYWN0aXZlLgo+ID4KPiA+IEknZCB0aGVyZWZvcmUgYmUgbW9yZSB0ZW1wdGVkIHRvIGRlZmVy
IHRoZSBwcmludCB0byB0aGUgYi5wLiB0cmFwCj4gPiBoYW5kbGVyIGl0c2VsZiBhbmQgbWFrZSB0
aGlzIHBhcnQgb2Yga2dkYl9wYW5pYygpIGxvb2sgbW9yZSBsaWtlOgo+ID4KPiA+ICAgICAgICAg
a2dkYl9wYW5pY19tc2cgPSBtc2c7Cj4gPiAgICAgICAgIGtnZGJfYnJlYWtwb2ludCgpOwo+ID4g
ICAgICAgICBrZ2RiX3BhbmljX21zZyA9IE5VTEw7Cj4KPiBVbmZvcnR1bmF0ZWx5IEkgdGhpbmsg
dGhhdCBvbmx5IHNvbHZlcyBoYWxmIHRoZSBwcm9ibGVtLiBBcyBhIHF1aWNrCj4gdGVzdCwgSSB0
cmllZCBzaW1wbHkgY29tbWVudGluZyBvdXQgdGhlICJrZGJfcHJpbnRmIiBsaW5lIGluCj4ga2dk
Yl9wYW5pYygpLiBXaGlsZSB0aGF0IGF2b2lkcyB0aGUgaW50ZXJsZWF2ZWQgcGFuaWMgbWVzc2Fn
ZSBhbmQKPiBiYWNrdHJhY2UsIGl0IGRvZXMgbm90aGluZyB0byBhY3R1YWxseSBnZXQgdGhlIGJh
Y2t0cmFjZXMgcHJpbnRlZCBvdXQKPiBiZWZvcmUgeW91IGVuZCB1cCBpbiBrZGIuIEFzIGFuIGV4
YW1wbGUsIHRoaXMgaXMgd2hhdCBoYXBwZW5lZCB3aGVuIEkKPiB1c2VkIGBlY2hvIEhBUkRMT0NL
VVAgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9wcm92b2tlLWNyYXNoL0RJUkVDVGAgYW5kCj4gaGFkIHRo
ZSAia2RiX3ByaW50ZiIgaW4ga2dkYl9wYW5pYygpIGNvbW1lbnRlZCBvdXQ6Cj4KPiBbICAgNzIu
NjU4NDI0XSBsa2R0bTogUGVyZm9ybWluZyBkaXJlY3QgZW50cnkgSEFSRExPQ0tVUAo+IFsgICA4
Mi4xODE4NTddIHdhdGNoZG9nOiBXYXRjaGRvZyBkZXRlY3RlZCBoYXJkIExPQ0tVUCBvbiBjcHUg
Ngo+IC4uLgo+IFsgICA4Mi4yMzQ4MDFdIFNlbmRpbmcgTk1JIGZyb20gQ1BVIDUgdG8gQ1BVcyA2
Ogo+IFsgICA4Mi4yMzkyOTZdIE5NSSBiYWNrdHJhY2UgZm9yIGNwdSA2Cj4gLi4uIFsgc3RhY2sg
dHJhY2UgZm9yIENQVSA2IF0gLi4uCj4gWyAgIDgyLjI0MDI5NF0gTk1JIGJhY2t0cmFjZSBmb3Ig
Y3B1IDUKPiAuLi4gWyBzdGFjayB0cmFjZSBmb3IgQ1BVIDUgXSAuLi4KPiBbICAgODIuNTc2NDQz
XSBTZW5kaW5nIE5NSSBmcm9tIENQVSA1IHRvIENQVXMgMC00LDc6Cj4gWyAgIDgyLjU4MTI5MV0g
Tk1JIGJhY2t0cmFjZQo+IEVudGVyaW5nIGtkYiAoY3VycmVudD0weGZmZmZmZjgwZGE1YTEwODAs
IHBpZCA2OTc4KSBvbiBwcm9jZXNzb3IgNSBkdWUKPiB0byBLZXlib2FyZCBFbnRyeQo+IFs1XWtk
Yj4KPgo+IEFzIHlvdSBjYW4gc2VlLCBJIGRvbid0IHNlZSB0aGUgdHJhY2VzIGZvciBDUFVzIDAt
NCBhbmQgNy4gVGhvc2UgZG8KPiBzaG93IHVwIGlmIEkgdXNlIHRoZSAiZG1lc2ciIGNvbW1hbmQg
YnV0IGl0J3MgYSBiaXQgb2YgYSBoYXNzbGUgdG8gcnVuCj4gImRtZXNnIiB0byBsb29rIGZvciBh
bnkgZXh0cmEgZGVidWcgbWVzc2FnZXMgZXZlcnkgdGltZSBJIGRyb3AgaW4ga2RiLgo+Cj4gSSBn
dWVzcyBwZXJoYXBzIHRoYXQgcGFydCBpc24ndCBvYnZpb3VzIGZyb20gdGhlIGNvbW1pdCBtZXNz
YWdlPwoKSSBmaWd1cmVkIGl0IHdhcyBhIHJpc2suCgpJbiBmYWN0IGl0J3MgYW4gYXJlYSB3aGVy
ZSBteSBpbnN0aW5jdCB0byBob25vdXIgY29uc29sZSBtZXNzYWdlcyBhbmQgbXkKaW5zdGluY3Qg
dG8gZ2V0IGludG8gdGhlIGtlcm5lbCBhcyBzb29uIGFzIHBvc3NpYmxlIGFmdGVyIHRoZSBkZWNp
c2lvbgp0byBpbnZva2UgaXQgaGFzIGJlZW4gbWFkZSBjb21lIGludG8gY29uZmxpY3QuCgpJbiBv
dGhlciB3b3JkcyBkb2VzIGl0IG1hdHRlciB0aGF0IHRoZSBjb25zb2xlIGJ1ZmZlcnMgYXJlIG5v
dCBmbHVzaGVkCmJlZm9yZSBlbnRlcmluZyBrZ2RiPyBIb3dldmVyIGhhdmluZyB0aG91Z2h0IGFi
b3V0IGl0IGZvciBhIGxpdHRsZSB3aGlsZQooYW5kIGtub3dpbmcgdGhlIGNvbnNvbGUgY29kZSB0
ZW5kcyB0byBiZSB3cml0dGVuIHRvIGJlIGRlY2VudGx5IHJvYnVzdCkKSSBjYW4gY29tZSB0byB0
aGUgdmlldyB0aGUgZmx1c2hpbmcgaXMgYmVzdC4KCgo+IFNob3VsZCBJIHNlbmQgYSBuZXcgdmVy
c2lvbiB3aXRoIGFuIHVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UgaW5kaWNhdGluZwo+IHRoYXQgaXQn
cyBub3QganVzdCB0aGUganVtYmxlZCB0ZXh0IHRoYXQncyBhIHByb2JsZW0gYnV0IGFsc28gdGhl
IGxhY2sKPiBvZiBzdGFjayB0cmFjZXM/CgpObyByZWFsIG5lZWQuCgpJIGRvbid0IHJlYWxseSBs
aWtlIHNlZWluZyBrZGJfcHJpbnRmKCkgYmVpbmcgY2FsbGVkIGZyb20gaGVyZSBidXQKaGF2aW5n
IHJldmlld2VkIGEgYml0IG9mIGNvbnNvbGUgY29kZSBJIHRoaW5rIHdlIGNhbiBtaWdodCBiZSBh
YmxlCnRvIHVzZSB0aGUgbmV3IGluZnJhc3RydWN0dXJlIHRvIG1ha2Uga2RiX3ByaW50ZigpIGEg
c2xpZ2h0bHkgbGVzcwpoYXRlZnVsIDstKS4KCgpEYW5pZWwuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0
CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
