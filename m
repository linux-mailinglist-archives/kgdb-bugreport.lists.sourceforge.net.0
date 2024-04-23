Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2148A8AE341
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Apr 2024 13:02:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rzDus-0003Uy-Ax
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 23 Apr 2024 11:02:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rzDuq-0003Up-6X
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 Apr 2024 11:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4fN276X0o384Z8j3FLIwukjM5hYTBdG6Y0uEQv0QW3E=; b=LuR8S1U7+Bc7mbM/wUdFjyQ6AD
 2nXx93sCGLy9iNvy2PseLiWXfpNoR8VFU7yeSwjI4zTzTuz4Q9WIg5Pcqu5JIobxLgiMgXYgeFfbz
 ihSGLJzo3g4bbOL6/7wL9+siYkMlCePuQreqvQI3Ft+ppxbq25sKIOyo15o/gYextcxU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4fN276X0o384Z8j3FLIwukjM5hYTBdG6Y0uEQv0QW3E=; b=mD3pLPdHTHZPhZBMlUrcQop8r4
 s/SU+R6XOizJZedFfrYuAi6QLqldGItNw78oF+9iKNBVF1ONnTTjUVonrzSI/R/tGkUY+14X9tL1N
 lJbu8cJb/YNYnGq19f2687oFlP5lb3xrOmscbaFeW23zxuNIJyfuz7SpAxt8fL7YEr14=;
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rzDun-00071P-Bl for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 Apr 2024 11:02:24 +0000
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-41aa2f6ff01so7067425e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 Apr 2024 04:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713870135; x=1714474935; darn=lists.sourceforge.net;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4fN276X0o384Z8j3FLIwukjM5hYTBdG6Y0uEQv0QW3E=;
 b=mV5O7yMYH38J0EXe3jlbBtayhr7srzmXZIO7F82S4SutWUHw1zsiLgRqy2WG0hju6e
 LhWwBsBhgaZhheppLgJyyjylh7+7Sp9ZxyNbcIYu/rBC+Gn2QvWXK+ICk28K09gdFuQB
 PSTG+34PTJNgTcy4ygF+KBmhTRksCJVyrnnFrFdk9g5MChaK1nVusRb7khoB+3WZTXin
 g4+AAXBiBTvQg6FO6f1LmUEQQnjINS/Mxe02EcHFj3Hwd/zwWZsEwGeH0EeiN11SMNZT
 S7IDLfRkNiiuWUSwplDXnh9oLa/VIi8YXFuuUOBuDSEkxoIggVnn1lbp+CZxgwX8IgCh
 yQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713870135; x=1714474935;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4fN276X0o384Z8j3FLIwukjM5hYTBdG6Y0uEQv0QW3E=;
 b=LL6IVU6LE4tKJqpdsCpFBSdgbRpmk08CgL6ipqNONRlgoqwva4q21IAMQm1zedSc2t
 p7VRmzpQt5V5aZhdXwOJsnkTvOBWVS/fwqFsmXdIKrhfH+XHPBiPmWF08rYI+kkbvaHJ
 QYyh/tXx5f8OYWix+VL8vMLvhfP+tyBd9rkxmOxNl9OFBVFjwvQDvokscXaaggIZAlXN
 MYFU+rnw6429QyGDnRxAX5EHqReZGDcwhlWsIZPQlS1SLw+5MUq0Wcrzm7C8KKG9I6AT
 qoLRqYrXfPZEOc7jbi0AiYfUB/jcwziMth0HuUESOw7Nx6qrjqSiYNeurgZ6cG0UsoyD
 EkjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSE+EiGY+3i4P/bh9L6C0c9XD1Og6uZJQyl0LuNIYKblG+gYoRl/To6o/O4PrhI4FLSVhbxXLNA/OJ5MFo6crPxTEkQW6jwT1ghd5uZHxIsy5FMxw=
X-Gm-Message-State: AOJu0YxDq6P/DvSIskD2p8ka3NNlgglDHMlUuAPwlBFTBrh7Ndq51t8q
 mrtQ1xHFaWqcFeV3l9PqMCZrAH0Nl4xvAOu1j0qASv3NQnG7Qdev0fPIDqhfofE=
X-Google-Smtp-Source: AGHT+IGyoLxxNXB84SOaZLmPPJ4OsAAGIKmqG6QrGynLfiOOuEkZmyKzKN/zvnjVFVfYKuS9pq1zag==
X-Received: by 2002:a05:600c:1da3:b0:41a:3407:78f7 with SMTP id
 p35-20020a05600c1da300b0041a340778f7mr4435656wms.7.1713870135321; 
 Tue, 23 Apr 2024 04:02:15 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a05600c4f1000b0041a1fee2854sm9220735wmq.17.2024.04.23.04.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 04:02:14 -0700 (PDT)
Date: Tue, 23 Apr 2024 12:02:12 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20240423110212.GC1567803@aspen.lan>
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
 <20240422-kgdb_read_refactor-v2-7-ed51f7d145fe@linaro.org>
 <CAD=FV=XqSmD4WGyBp7Cv1i8X9yjk2gH1y2j_5qzkxtDL+GKv3g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=XqSmD4WGyBp7Cv1i8X9yjk2gH1y2j_5qzkxtDL+GKv3g@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Apr 22, 2024 at 04:52:52PM -0700, Doug Anderson wrote:
    > On Mon, Apr 22, 2024 at 9:38 AM Daniel Thompson > <daniel.thompson@linaro.org>
    wrote: > > diff --git a/kernel/debug/kdb/kdb_io.c b/ke [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: linaro.org]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [209.85.128.47 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.47 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1rzDun-00071P-Bl
Subject: Re: [Kgdb-bugreport] [PATCH v2 7/7] kdb: Simplify management of
 tmpbuffer in kdb_read()
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gTW9uLCBBcHIgMjIsIDIwMjQgYXQgMDQ6NTI6NTJQTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBPbiBNb24sIEFwciAyMiwgMjAyNCBhdCA5OjM44oCvQU0gRGFuaWVsIFRob21wc29u
Cj4gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPiB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS9r
ZXJuZWwvZGVidWcva2RiL2tkYl9pby5jIGIva2VybmVsL2RlYnVnL2tkYi9rZGJfaW8uYwo+ID4g
aW5kZXggOTRhNjM4YTlkNTJmYS4uNjQwMjA4Njc1YzlhOCAxMDA2NDQKPiA+IC0tLSBhL2tlcm5l
bC9kZWJ1Zy9rZGIva2RiX2lvLmMKPiA+ICsrKyBiL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX2lvLmMK
PiA+IEBAIC0zMTAsMjEgKzMwOSwxNiBAQCBzdGF0aWMgY2hhciAqa2RiX3JlYWQoY2hhciAqYnVm
ZmVyLCBzaXplX3QgYnVmc2l6ZSkKPiA+ICAgICAgICAgY2FzZSA5OiAvKiBUYWIgKi8KPiA+ICAg
ICAgICAgICAgICAgICBpZiAodGFiIDwgMikKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICsr
dGFiOwo+ID4gLSAgICAgICAgICAgICAgIHBfdG1wID0gYnVmZmVyOwo+ID4gLSAgICAgICAgICAg
ICAgIHdoaWxlICgqcF90bXAgPT0gJyAnKQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgcF90
bXArKzsKPiA+IC0gICAgICAgICAgICAgICBpZiAocF90bXAgPiBjcCkKPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOwo+ID4gLSAgICAgICAgICAgICAgIG1lbWNweSh0bXBidWZmZXIs
IHBfdG1wLCBjcC1wX3RtcCk7Cj4gPiAtICAgICAgICAgICAgICAgKih0bXBidWZmZXIgKyAoY3At
cF90bXApKSA9ICdcMCc7Cj4gPiAtICAgICAgICAgICAgICAgcF90bXAgPSBzdHJyY2hyKHRtcGJ1
ZmZlciwgJyAnKTsKPiA+IC0gICAgICAgICAgICAgICBpZiAocF90bXApCj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICArK3BfdG1wOwo+ID4gLSAgICAgICAgICAgICAgIGVsc2UKPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgIHBfdG1wID0gdG1wYnVmZmVyOwo+ID4gLSAgICAgICAgICAgICAg
IGxlbiA9IHN0cmxlbihwX3RtcCk7Cj4gPiAtICAgICAgICAgICAgICAgYnVmX3NpemUgPSBzaXpl
b2YodG1wYnVmZmVyKSAtIChwX3RtcCAtIHRtcGJ1ZmZlcik7Cj4gPiAtICAgICAgICAgICAgICAg
Y291bnQgPSBrYWxsc3ltc19zeW1ib2xfY29tcGxldGUocF90bXAsIGJ1Zl9zaXplKTsKPiA+ICsK
PiA+ICsgICAgICAgICAgICAgICB0bXAgPSAqY3A7Cj4gPiArICAgICAgICAgICAgICAgKmNwID0g
J1wwJzsKPiA+ICsgICAgICAgICAgICAgICBwX3RtcCA9IHN0cnJjaHIoYnVmZmVyLCAnICcpOwo+
ID4gKyAgICAgICAgICAgICAgIHBfdG1wID0gKHBfdG1wID8gcF90bXAgKyAxIDogYnVmZmVyKTsK
PiA+ICsgICAgICAgICAgICAgICBzdHJzY3B5KHRtcGJ1ZmZlciwgcF90bXAsIHNpemVvZih0bXBi
dWZmZXIpKTsKPgo+IFlvdSdyZSBub3cgdXNpbmcgc3Ryc2NweSgpIGhlcmUuIElzIHRoYXQgYWN0
dWFsbHkgaW1wb3J0YW50LCBvciBhcmUKPiB5b3UganVzdCBmb2xsb3dpbmcgZ29vZCBwcmFjdGlj
ZXMgYW5kIGJlaW5nIGV4dHJhIHBhcmFub2lkPyBJZiBpdCdzCj4gYWN0dWFsbHkgaW1wb3J0YW50
LCB0aGlzIHByb2JhYmx5IGFsc28gbmVlZHMgdG8gYmUgQ0NlZCB0byBzdGFibGUsCj4gcmlnaHQ/
IFRoZSBvbGQgY29kZSBqdXN0IGFzc3VtZWQgdGhhdCBpdCAgY291bGQgY29weSB0aGUgd2hvbGUg
YnVmZmVyCj4gaW50byB0bXBidWZmZXIuIEkgYXNzdW1lIHRoYXQgd2FzIE9LLCBidXQgaXQgd2Fz
bid0IGRvY3VtZW50ZWQgaW4gdGhlCj4gZnVuY3Rpb24gY29tbWVudHMgdGhhdCB0aGVyZSB3YXMg
YSBtYXhpbXVtIHNpemUgdGhhdCBidWZmZXIgY291bGQKPiBiZS4uLgoKVGhpcyBpcyBwcmV0dHkg
bXVjaCBpdC4KCkkgdXNlZCBzdHJzY3B5KCkgYmVjYXVzZSB0aGUgZnVuY3Rpb24gZG9lcyBub3Qg
ZG9jdW1lbnQgYW55IHVwcGVyIGxpbWl0Cm9uIHRoZSBsZW5ndGggb2YgdGhlIHN1cHBsaWVkIGJ1
ZmZlci4gVGh1cyB1c2luZyBzdHJzY3B5KCkgbWVhbnMgd2UgYXJlCnJlc2lsaWVudCBpbiB0aGUg
ZmFjZSBvZiBmdXR1cmUgcmVmYWN0b3JpbmcuCgpJIGNob3NlIG5vdCB0byBDYzogc3RhYmxlQC4u
LiBzaW5jZSBpdCdzIG9ubHkgYSB0aGVvcmV0aWMgb3ZlcmZsb3cuCldpdGggdGhlIGNvZGUgYXMg
aXQgY3VycmVudGx5IGlzIGtkYl9yZWFkKCkgc2hvdWxkIG5ldmVyIGJlIHBhc3NlZCBhCmJ1ZmZl
ciBsb25nIGVub3VnaCB0byBjYXVzZSBwcm9ibGVtcy4KCgpEYW5pZWwuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGlu
ZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
